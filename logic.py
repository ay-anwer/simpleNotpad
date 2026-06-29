
class EditorLogic:
    def open_file(self, path):

        try:
            with open(path, 'r', encoding='utf-8') as f:
                return f.read()

        except Exception as e:
            return f"Error opening file: {str(e)}"

    def save_file(self, path, content):

        try:
            with open(path, 'w', encoding='utf-8') as f:
                f.write(content)
            return True

        except Exception as e:
            print(f"Error saving file: {e}")
            return False
