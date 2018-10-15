#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "basilecontrol.h"

QT_BEGIN_NAMESPACE
class QAction;
class QMenu;
class QPlainTextEdit;
class QSessionManager;
QT_END_NAMESPACE

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
     void loadFile(const QString &fileName);
    ~MainWindow();

private:
    Ui::MainWindow *ui;


private slots:

void on_pushButton_SetExTime_clicked();

void on_pushButton_SetMode_clicked();

void on_pushButton_GetMode_clicked();

void on_pushButton_CFMode_clicked();

void on_comboBox_CFMode_activated(int index);

void on_pushButton_Start_clicked();

void on_pushButtonRotate_clicked();

void on_pushButton_getExTime_clicked();

private:

SBaslerCameraControl* m_control = Q_NULLPTR;

QMatrix m_matrix;


//这是菜单栏的
protected:
    void closeEvent(QCloseEvent *event) override;

private slots:
    void newFile();
    void open();
    bool save();
    bool saveAs();
    void about();
    void documentWasModified();
#ifndef QT_NO_SESSIONMANAGER
    void commitData(QSessionManager &);
#endif

    void on_action_triggered();

private:
    void createActions();
    void createStatusBar();
    void readSettings();
    void writeSettings();
    bool maybeSave();
    bool saveFile(const QString &fileName);
    void setCurrentFile(const QString &fileName);
    QString strippedName(const QString &fullFileName);

    QPlainTextEdit *textEdit;
    QString curFile;
//
};

#endif // MAINWINDOW_H
