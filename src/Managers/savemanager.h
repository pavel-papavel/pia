#ifndef SAVEMANAGER_H
#define SAVEMANAGER_H

#include <QObject>
#include <QSettings>

class SaveManager : public QSettings
{
    Q_OBJECT
public:
  SaveManager(QObject *parent = 0);
  virtual ~SaveManager();

  Q_INVOKABLE
  void setValue(const QString &key, const QVariant &value);

  Q_INVOKABLE
  void setValueIfNotSet(const QString &key, const QVariant &value);

  Q_INVOKABLE
  QVariant value(const QString &key, const QVariant &defaultValue);

  Q_INVOKABLE
  bool boolValue(const QString &key, const bool defaultValue);

  Q_INVOKABLE
  QString stringValue(const QString &key, const bool defaultValue = "");

  Q_INVOKABLE
  int intValue(const QString &key, const bool defaultValue = 0);

  Q_INVOKABLE
  void initToDefaults();

signals:
  void saveManagerChanged(const QString& key);
};

#endif // SAVEMANAGER_H
