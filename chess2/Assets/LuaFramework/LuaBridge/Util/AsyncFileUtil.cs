using System;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;


public class AsyncFileOperationData
{
    public string filePath;
    public byte[] content;
    public string method;
    public bool drop;
    public string guid;
    public string json;
}

public static class AsyncFileUtil {
    private static Thread s_thread;
    private static bool s_end;
    private static List<AsyncFileOperationData> s_queue = new List<AsyncFileOperationData>();
    private static Queue<AsyncFileOperationData> s_finished_queue = new Queue<AsyncFileOperationData>();
    public static void StartFileOperationThread()
    {
        s_end = false;
        s_thread = new Thread(new ThreadStart(OperationLoop));
        s_thread.Start();
    }

    public static void EndFileOperationTread()
    {
        s_end = true;
    }
    
    public static int GetFileOperationCount()
    {
        return s_queue.Count;
    }

    private static void OperationLoop()
    {
        while(!s_end)
        {
            Thread.Sleep(2);
            AsyncFileOperationData operationData = null;
            lock(s_queue)
            {
                if(s_queue.Count > 0)
                {
                    operationData = s_queue[0];
                    s_queue.RemoveAt(0);
                }
            }
            try
            {
                if (operationData != null)
                {
                    if (!operationData.drop)
                    {
                        if (operationData.method == "delete")
                        {
                            if (FileUtility.Exists(operationData.filePath))
                            {
                                FileUtility.Delete(operationData.filePath);
                            }

                            for (int i = 0; i < s_queue.Count; i++)
                            {
                                if (s_queue[i].filePath == operationData.filePath)
                                {
                                    s_queue[i].drop = true;
                                }
                            }
                        }
                        else if (operationData.method == "append")
                        {
                            FileUtility.SaveFile(operationData.filePath, operationData.content, true);
                        }
                        else if (operationData.method == "write")
                        {
                            FileUtility.SaveFile(operationData.filePath, operationData.content, false);
                        }
                        else if (operationData.method == "directoryMove")
                        {
                            string[] paths = operationData.filePath.Split(',');
                            FileUtility.DirectoryMove(paths[0], paths[1]);
                            lock (s_finished_queue)
                            {
                                s_finished_queue.Enqueue(operationData);
                            }
                        }
                        else if (operationData.method == "compressDir")
                        {
                            string[] parameters = operationData.filePath.Split(',');
                            lzip.compressDir(parameters[0], int.Parse(parameters[1]), parameters[2], bool.Parse(parameters[3]));
                            lock (s_finished_queue)
                            {
                                s_finished_queue.Enqueue(operationData);
                            }
                        }
                        else if (operationData.method == "readAllBytes")
                        {
                            byte[] bytes = FileUtility.ReadAllBytes(operationData.filePath);
                            operationData.content = bytes;
                            lock (s_finished_queue)
                            {
                                s_finished_queue.Enqueue(operationData);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                Debug.LogException(e);
            }

        }
    }

    public static void AddFileOperationToQueue(string filePath, byte[] content, string method, bool insert = false, string guid = null)
    {
        AsyncFileOperationData operationData = new AsyncFileOperationData();
        operationData.filePath = filePath;
        operationData.content = content;
        operationData.method = method;
        operationData.guid = guid;
        lock(s_queue)
        {
            if(insert)
            {
                s_queue.Insert(0, operationData);
            }
            else
            {
                s_queue.Add(operationData);
            }
        }

        if(s_thread == null)
        {
            StartFileOperationThread();
        }
    }

    public static AsyncFileOperationData GetFinishedAsyncFileOperationData()
    {
        lock(s_finished_queue)
        {
            if(s_finished_queue.Count > 0)
            {
                AsyncFileOperationData operationData = s_finished_queue.Dequeue();
                return operationData;
            }
            return null;
        }
    }
}

