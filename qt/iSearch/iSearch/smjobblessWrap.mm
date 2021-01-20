#include "smjobblessWrap.h"
#include "smjobbless.h"
SMJob::SMJob()
{
    m_pSMJob  = [[MacSMJob alloc]init];


}

void SMJob::Install()
{
    if(m_pSMJob)
    {
        MacSMJob* pSMJob = (MacSMJob*)m_pSMJob;
        [pSMJob initHelperTool];
    }

}
