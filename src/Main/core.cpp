#include <QGuiApplication>

#include "core.h"

Core::Core(QObject *parent)
    : QObject{parent}
{
    if (QGuiApplication::screens().size() > 1)
    {
        _multipleDisplayMode = true;
    }
}

bool Core::getMultipleDisplayMode() const
{
    return _multipleDisplayMode;
}
