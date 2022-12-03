#include <QDebug>

#include "savemanager.h"

SaveManager::SaveManager(QObject *parent)
    : QSettings("HomeProject", "PIA", parent)
{
}

SaveManager::~SaveManager() {
}

QVariant SaveManager::value(const QString &key, const QVariant &defaultValue = QVariant()) {
  return QSettings::value(key, defaultValue);
}

bool SaveManager::boolValue(const QString &key, bool defaultValue) {
    return QSettings::value(key, defaultValue).toBool();
}

QString SaveManager::stringValue(const QString &key, const bool defaultValue)
{
    return QSettings::value(key, defaultValue).toString();
}

int SaveManager::intValue(const QString &key, const bool defaultValue)
{
    return QSettings::value(key, defaultValue).toInt();
}

void SaveManager::setValue(const QString &key, const QVariant &value) {
  QSettings::setValue(key, value);
  emit saveManagerChanged(key);
}

void SaveManager::setValueIfNotSet(const QString &key, const QVariant &value) {

  if( !QSettings::contains(key) ) {
    QSettings::setValue(key, value);
    emit saveManagerChanged(key);
  }
}

void SaveManager::initToDefaults() {
  setValueIfNotSet("test", true);
}
