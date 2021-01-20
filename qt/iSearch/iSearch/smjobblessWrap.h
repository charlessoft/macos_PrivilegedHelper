#ifndef CUSTOMWEBVIEW_1H
#define CUSTOMWEBVIEW_1H


#include <QPointer>
#include <QVariant>
#include <vector>
using namespace std;

class SMJob{
public:

    SMJob();
    void *m_pSMJob = nullptr;

    void Install();

};

#endif
