#ifndef CORE_H
#define CORE_H

#include <QObject>

class Core : public QObject
{
    Q_OBJECT
public:
    explicit Core(QObject *parent = nullptr);

Q_INVOKABLE
    bool getMultipleDisplayMode() const;
signals:

private:
    bool _multipleDisplayMode = false;
};

#endif // CORE_H
