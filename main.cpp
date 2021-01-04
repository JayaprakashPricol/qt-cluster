#include <QApplication>
#include <QQmlApplicationEngine>
#include <general.h>
#include <pointer.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

   // QQmlApplicationEngine engine;
    MainWindow objmain;

   // engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
