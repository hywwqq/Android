/**************************************************************************************************/
/* Copyright (C) Wangqun, SSE@USTC, 2014-2015                                                     */
/*                                                                                                */
/* FILE NAME               : lab1_main.c                                                          */
/* PRINCIPAL AUTHOR        : Wangqun                                                              */
/* SUBSYSTEM NAME          : main                                                                 */
/* MODULE NAME             : main                                                                 */
/* LANGUAGE                : C                                                                    */
/* TARGET ENVIRONMENT      : ANY                                                                  */
/* DATE OF FIRST RELEASE   : 2014/09/15                                                           */
/* DESCRIPTION             : This is a menu program                                               */
/**************************************************************************************************/

/*
* Revision log:
*
* Created by Wangqun, 2014/09/15
*
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DESC_LEN    1024
#define CMD_NUM     3
#define CMD_LEN     200
#define FALSE       0
#define TRUE        1

/* data struct and its operations */
typedef struct DataNode
{
    char    cmd[CMD_LEN];
    char    desc[DESC_LEN];
    struct  DataNode *next;
}tDataNode;

/* Create a Linklist */
tDataNode *CreateLintlist()
{
	tDataNode *phead = NULL;
	phead = (tDataNode *)malloc(sizeof(tDataNode));
    phead->next = NULL;
    return phead;
}

/* menu program */
static tDataNode data[] =
{
	{ "help", "This is help cmd!", NULL },
	{ "version", "program version is v1.0.", NULL},
	{ "exit", "the program will exit!", NULL}
};

/* Initialize the Linklist and return the datanode pointer*/
tDataNode *Initialization(tDataNode *phead)
{
	int i;
	tDataNode *p = NULL;
	tDataNode *q = NULL;
	p = (tDataNode *)malloc(sizeof(tDataNode));
    p = phead;
    for (i=0; i < CMD_NUM; i++)
    {
    	q = (tDataNode*)malloc(sizeof(tDataNode));
    	strcpy(q->cmd,data[i].cmd);
    	strcpy(q->desc,data[i].desc);
        p->next = q;
        p = q;
    }
    return phead;
}

/* Show the Linklist*/
void ShowAllCmd(tDataNode *phead)
{
	printf("Menu List:\n");
    tDataNode *p = phead->next;
    while(p != NULL)
    {
        printf("%s - %s\n", p->cmd, p->desc);
        p = p->next;
    }

}

/* Find the cmd in Linklist and return the datanode pointer*/
void FindCmd(tDataNode *phead)
{
	while(1)
    {
    	int flag = FALSE;
        char pcmd[CMD_LEN];
        printf("Input a cmd instruction > ");
        scanf("%s", pcmd);

        tDataNode *p = phead;
        while(p != NULL)
        {
            if(!strcmp(pcmd, p->cmd))
            {
            	flag = TRUE;
                printf("%s\n", p->desc);
                if(!strcmp(pcmd, "help"))
                {
                	ShowAllCmd(phead);
                }
                if(!strcmp(pcmd, "exit"))
                {
                	return ;
                }
                break;
            }
            p = p->next;
        }
        if (!flag)
        {
        	printf("Wrong instruction!\n");
        }
    }
}

int main()
{
	/* program begin*/
	tDataNode *head = NULL;
    head = CreateLintlist();
    Initialization(head);
    FindCmd(head);
    return 0;
}
