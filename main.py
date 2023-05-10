import glob, os, sys

def search_files_with_string(root_dir, search_string):
    files = []
    search_pattern = os.path.join(root_dir, '**', 'default.nix')
    for file_path in glob.iglob(search_pattern, recursive=True):
        with open(file_path, 'r') as f:
            if search_string in f.read():
                print(file_path)
                files.append("- " + file_path)
    if files == []:
        print("Maintainer's packages were not found")
    return files

def insert_strings_between_markers(file_path, start_marker, end_marker, strings_list):
    with open(file_path, 'r') as f:
        lines = f.readlines()

    start_index = None
    end_index = None
    for i, line in enumerate(lines):
        if start_marker in line:
            start_index = i
        elif end_marker in line:
            end_index = i

    if start_index is None or end_index is None:
        raise ValueError('Start or end marker not found in file')

    lines[start_index+1:end_index] = []

    lines[start_index+1:start_index+1] = [f'{s}\n' for s in strings_list]

    with open(file_path, 'w') as f:
        f.write(''.join(lines))


if __name__ == '__main__':
    if len(sys.argv) != 4:
       raise ValueError("Incorrect number of arguments. Usage: python script.py file_to_edit path_nixpkgs maintainer_name")
    file_path = sys.argv[1]
    print(f"File to edit : {file_path}")
    path_nixpkgs = sys.argv[2]
    print(f"Path to nixpkgs/pkgs : {path_nixpkgs}")
    maintainer = sys.argv[3]
    print(f"Maintener: {maintainer}")
    insert_strings_between_markers(file_path, '<!-- NIX-PACKAGES:START -->', '<!-- NIX-PACKAGES:END -->', search_files_with_string(path_nixpkgs, maintainer))

