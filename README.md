# Nix 'Maintained by'

This Github action module will display the packages maintained by a certain user. 

## Usage

To use this GitHub Action, you'll need to create a workflow file in your repository's `.github/workflows` directory. For example, you could create a file called `maintained_by_qjoly.yml` with the following contents:

```yaml
name: Run action on test.md

on:
  push:
    branches:
      - main
jobs:
  run_action:
    runs-on: ubuntu-latest
    name: Run 'Nix-Maintened_by'
    steps:
      - uses: actions/checkout@v3 # Clone your code
      
      - uses: actions/checkout@v3 # Clone NixPkgs
        with:
          path: './nixpkgs'
          repository: 'NixOS/nixpkgs'
      
      - name: Run nix-maintainers-get-packages # Run action 
        uses: qjoly/Nix-Maintained_by@v0.1.3
        with:
          file: './test.md'
          path_nixpkgs: './nixpkgs/pkgs'
          maintainer: 'qjoly'
```

This workflow specifies that it should be triggered on push events. The job has three steps:

1. Check out your repository using the `actions/checkout` action.
2. Check out the repository `NixOS/nixpkgs`  using the `actions/checkout` action.
3. Run the Github action `qjoly/Nix-Maintained_by@v0.1.3` to find which packages are maintained by `maintainer` and write the result in `test.md`. The markdown file will be commited and pushed

To put the package list, the `test.md` file must contain the following markers:
```markdown
<!-- NIX-PACKAGES:START -->
Anything here will be deleted
<!-- NIX-PACKAGES:END -->
```

## Example of output

```md
## Nix Package maintained by @qjoly

<!-- NIX-PACKAGES:START -->
- [aiac](https://github.com/gofireflyio/aiac/)
- [k9s](https://github.com/derailed/k9s)
<!-- NIX-PACKAGES:END -->
```

## Inputs

### `file`

**Required** The markdown file where the output will be writed

### `path_nixpkgs`

**Required** The path to the repository `NixOS/nixpkgs`

### `Maintainer`

**Required** The maintainer name

## Outputs

This GitHub Action does not have any outputs.

## License

This GitHub Action is licensed under the [MIT License](LICENSE).
