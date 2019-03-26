import sys

from PyQt5.QtCore import QUrl
from PyQt5.QtQuickWidgets import QQuickWidget
from PyQt5.QtWidgets import QApplication, QWidget, QHBoxLayout, QGraphicsView, QGraphicsScene


class Window(QWidget):
    RIGHT_SIDEBAR_VIEW_PATH = "side-bar-ui.qml"

    def __init__(self):
        QWidget.__init__(self)
        self.move(1000, 90)
        self.resize(322, 600)
        self._define_ui()
        self._connect_ui()
        self._init_window()
        self.show()

    def _define_ui(self):
        self.quick = QQuickWidget()
        self.quick.setSource(QUrl().fromLocalFile(self.RIGHT_SIDEBAR_VIEW_PATH))
        self.quick.setResizeMode(QQuickWidget.SizeRootObjectToView)

        self._rootObject = self.quick.rootObject()

    def _connect_ui(self):
        self.quick.statusChanged.connect(self.handleStatusChange)

    def _init_window(self):
        box_layout = QHBoxLayout()
        box_layout.addWidget(self.quick)
        self.setLayout(box_layout)

    def handleStatusChange(self, status):
        if status == self.quick.Error:
            [print(e.toString()) for e in self.quick.errors()]


app = QApplication(sys.argv)
window = Window()
sys.exit(app.exec_())
