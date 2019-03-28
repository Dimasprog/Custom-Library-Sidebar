import sys

from PyQt5.QtCore import QUrl, pyqtSlot, pyqtSignal
from PyQt5.QtQuickWidgets import QQuickWidget
from PyQt5.QtWidgets import QApplication, QWidget, QHBoxLayout


class Window(QWidget):
    RIGHT_SIDEBAR_VIEW_PATH = "side-bar-ui.qml"

    def __init__(self):
        QWidget.__init__(self)
        self.move(450, 90)
        self.resize(322, 600)
        self._define_ui()
        self._connect_ui()
        self._init_window()
        self.show()

    def _define_ui(self):
        self.quick = QQuickWidget()
        self.quick.statusChanged.connect(self.handleStatusChange)
        self.quick.setSource(QUrl().fromLocalFile(self.RIGHT_SIDEBAR_VIEW_PATH))
        self.quick.setResizeMode(QQuickWidget.SizeRootObjectToView)

        self._quick = self.quick.rootObject()

    def _connect_ui(self):
        self._quick.newImage.connect(self._newImage)
        self._quick.editImage.connect(self._editImage)
        self._quick.deleteImage.connect(self._deleteImage)

    def _init_window(self):
        box_layout = QHBoxLayout()
        box_layout.addWidget(self.quick)
        self.setLayout(box_layout)

    def handleStatusChange(self, status):
        if status == self.quick.Error:
            [print(e.toString()) for e in self.quick.errors()]

    @pyqtSlot(str)
    def _newImage(self, index):
        print("newImage({0})".format(int(index) + 1))

    @pyqtSlot(str)
    def _editImage(self, index):
        print("edit({0})".format(int(index) + 1))

    @pyqtSlot(str)
    def _deleteImage(self, index):
        print("delete({0})".format(int(index) + 1))


if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = Window()
    sys.exit(app.exec_())
