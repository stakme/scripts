extern crate yaml_rust;
use std::fs::File;
use std::io::prelude::*;
use std::process::Command;
use structopt::StructOpt;
use yaml_rust::{YamlEmitter, YamlLoader};

/// Search for a pattern in a file and display the lines that contain it.
#[derive(StructOpt)]
struct Cli {
    /// The path to the file to read
    #[structopt(parse(from_os_str))]
    config: std::path::PathBuf,
}

fn multipass_version() -> Option<String> {
    let mut cmd = Command::new("multipass");
    cmd.arg("version");

    let output = cmd.output().ok()?;
    let cs = String::from_utf8(output.stdout).ok()?;

    let separator: char = ' ';
    let newline: char = '\n';
    let mut started = false;
    let mut v = String::new();
    for c in cs.chars() {
        if c == separator {
            started = true;
            continue;
        }
        if c == newline {
            break;
        }

        if !started {
            continue;
        }
        v.push(c);
    }
    Some(v)
}

fn main() -> Result<(), std::io::Error> {
    let multipass_version = multipass_version()
        .expect("multipass is not found: please install it first. https://multipass.run");

    println!("multipass found: version {}", multipass_version);
    let args = Cli::from_args();

    let mut file = File::open(args.config)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    assert_eq!(contents, "Hello, world!");
    Ok(())

    // let docs = YamlLoader::load_from_str(source: &str);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn split() {
        assert_eq!(Some("1.7.2+mac".to_string()), multipass_version());
    }
}
