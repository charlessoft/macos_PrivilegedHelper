#include "dialog.h"
#include "ui_dialog.h"
#include "smjobblessWrap.h"


Dialog::Dialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog)
{
    ui->setupUi(this);
}

Dialog::~Dialog()
{
    delete ui;
}

void Dialog::on_toolButton_clicked()
{
//    [[SMJob alloc]init];
    SMJob smjob;
    smjob.Install();
    int x = 0;
}
