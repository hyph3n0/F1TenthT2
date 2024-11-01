#ifndef SBK_ROSPLUGINLIBPLUGINPROVIDER_FORPLUGINPROVIDERSWRAPPER_H
#define SBK_ROSPLUGINLIBPLUGINPROVIDER_FORPLUGINPROVIDERSWRAPPER_H

#define protected public

#include <qt_gui_cpp/ros_pluginlib_plugin_provider_for_plugin_providers.h>


// Extra includes
#include <qt_gui_cpp/ros_pluginlib_plugin_provider.h>
#include <qt_gui_cpp/plugin_provider.h>
#include <QMap>
#include <qobject.h>
#include <QList>
#include <qt_gui_cpp/plugin_descriptor.h>
#include <qt_gui_cpp/plugin_context.h>
#include <qt_gui_cpp/plugin.h>
#include <qcoreevent.h>
#include <qmetaobject.h>
#include <qbytearray.h>
#include <qthread.h>
#include <qobjectdefs.h>
namespace PySide { class DynamicQMetaObject; }

class RosPluginlibPluginProvider_ForPluginProvidersWrapper : public qt_gui_cpp::RosPluginlibPluginProvider_ForPluginProviders
{
public:
    RosPluginlibPluginProvider_ForPluginProvidersWrapper(const QString & export_tag, const QString & base_class_type);
    void childEvent(QChildEvent * event) override;
    void connectNotify(const QMetaMethod & signal) override;
    void customEvent(QEvent * event) override;
    void disconnectNotify(const QMetaMethod & signal) override;
    QMap<QString,QString > discover(QObject * discovery_data) override;
    QList<qt_gui_cpp::PluginDescriptor* > discover_descriptors(QObject * discovery_data) override;
    bool event(QEvent * e) override;
    bool eventFilter(QObject * watched, QEvent * event) override;
    void init_plugin(const QString & arg__1, qt_gui_cpp::PluginContext * plugin_context, qt_gui_cpp::Plugin * plugin) override;
    void * load(const QString & plugin_id, qt_gui_cpp::PluginContext * plugin_context) override;
    qt_gui_cpp::PluginProvider * load_explicit_type(const QString & plugin_id, qt_gui_cpp::PluginContext * plugin_context) override;
    qt_gui_cpp::Plugin * load_plugin(const QString & plugin_id, qt_gui_cpp::PluginContext * plugin_context) override;
    const QMetaObject * metaObject() const override;
    void timerEvent(QTimerEvent * event) override;
    void unload(void * instance) override;
    ~RosPluginlibPluginProvider_ForPluginProvidersWrapper();
public:
    int qt_metacall(QMetaObject::Call call, int id, void **args) override;
    void *qt_metacast(const char *_clname) override;
    static void pysideInitQtMetaTypes();
    void resetPyMethodCache();
private:
    mutable bool m_PyMethodCache[15];
};

#endif // SBK_ROSPLUGINLIBPLUGINPROVIDER_FORPLUGINPROVIDERSWRAPPER_H

