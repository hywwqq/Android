/**************************************************************************************************/
/* Copyright (C) Wangqun, SSE@USTC, 2014-2015                                                     */
/*                                                                                                */
/* FILE NAME               : lab1_main.c                                                          */
/* PRINCIPAL AUTHOR        : Wangqun                                                              */
/* SUBSYSTEM NAME          : main                                                                 */
/* MODULE NAME             : main                                                                 */
/* LANGUAGE                : C                                                                    */
/* TARGET ENVIRONMENT      : ANY                                                                  */
/* DATE OF FIRST RELEASE   : 2014/09/14                                                           */
/* DESCRIPTION             : This is a menu program                                               */
/**************************************************************************************************/

/*
* Revision log:
*
* Created by Wangqun, 2014/09/14
*
*/


#include <stdio.h>
#include <stdlib.h>

void init();
#define DESC_LEN    1024
#define CMD_NUM     10

typedef struct DataNode
{
    int     cmd;
    char    desc[DESC_LEN];
    struct  DataNode *next;
} tDataNode;

int main()
{
	/* create a Linklist and initialize it */
    tDataNode *head = NULL;
    tDataNode * p = NULL;
    tDataNode * q = NULL;
    head = (tDataNode *)malloc(sizeof(tDataNode));
    p = (tDataNode *)malloc(sizeof(tDataNode));
    head = p;
    for (int i=0; i<CMD_NUM; i++)
    {
    	q = (tDataNode*)malloc(sizeof(tDataNode));
        q->cmd = i;
        snprintf(q->desc, DESC_LEN, "This is %d cmd!", i);  
        p->next = q;
        p = q;
    }

    /* show the Linklist */
    printf("Menu List:\n");
    p = head->next;
    while(p != NULL)
    {
        printf("%d - %s\n", p->cmd, p->desc);
        p = p->next;
    }
    
    /* to query what you input*/
    while(1)
    {
        int cmd;
        printf("Input a cmd number > ");
        scanf("%d", &cmd);
        if(cmd >= CMD_NUM)
        {
            printf("This is a wrong cmd number!\n ");
            continue;
        }
        p = head;
        while(p != NULL)
        {
            if(p->cmd == cmd)
            {
                printf("%d - %s\n", p->cmd, p->desc);
                break;
            }
            p = p->next;
        }
    }
    return 0;
}