test:
    cargo test --verbose
# Generate coverage report
coverage type="html": test
    #!/usr/bin/env bash
    rm -f ./**/*.profraw
    echo "Running tests..."
    CARGO_INCREMENTAL=1 RUSTFLAGS='-Cinstrument-coverage' LLVM_PROFILE_FILE='cargo-test-%p-%m.profraw' cargo test
    echo "Generating report..."
    grcov . --binary-path ./target/debug/ -s . -t {{type}} --branch --ignore-not-existing -o ./target/debug/coverage/
