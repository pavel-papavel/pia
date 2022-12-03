#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlContext>
#include "src/Main/core.h"
#include "src/Managers/savemanager.h"

int main(int argc, char *argv[])
{
    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    }
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    SaveManager *saveManager = new SaveManager();

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    qmlRegisterType<Core>("Core", 1, 0, "Core");

    engine.rootContext()->setContextProperty("saveManager", saveManager);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
