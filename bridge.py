from PySide6.QtCore import QObject, Slot, Signal, QUrl
from PySide6.QtQml import QmlElement
from logic import EditorLogic

QML_IMPORT_NAME = "App.Backend"
QML_IMPORT_MAJOR_VERSION = 1

@QmlElement
class EditorBridge(QObject):
    textLoaded = Signal(str)
    saveStatus = Signal(bool)

    def __init__(self, parent=None):
        super().__init__(parent)
        self.logic = EditorLogic()

    @Slot(str)
    def requestOpenFile(self, file_url):
        local_path = QUrl(file_url).toLocalFile()
        content = self.logic.open_file(local_path)
        self.textLoaded.emit(content)

    @Slot(str, str)
    def requestSaveFile(self, file_url, content):
        local_path = QUrl(file_url).toLocalFile()
        success = self.logic.save_file(local_path, content)
        self.saveStatus.emit(success)
