import sys
import os
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle

# من المهم جداً استدعاء ملف الـ bridge هنا حتى يتعرف محرك QML على الكلاسات الجديدة (@QmlElement)
import bridge 

def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # تحديد مسار ملف main.qml ديناميكياً بناءً على مسار مجلد السكربت الحالي
    current_dir = Path(__file__).resolve().parent
    qml_file = os.path.join(current_dir, "main.qml")
    # تحميل ملف الواجهة    QQuickStyle.setStyle("Material")
    QQuickStyle.setStyle("Material")
    engine.load(qml_file)

    # التحقق من نجاح التحميل
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())

if __name__ == "__main__":
    main()
