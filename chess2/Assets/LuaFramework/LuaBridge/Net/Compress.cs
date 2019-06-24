using System;
using System.Collections.Generic;

public class CDecompress
{
    public CDecompress(uint chuangkoudaxiao = 1024 * 1024)
    {
        Reset(chuangkoudaxiao);
    }
    public void Reset(uint chuangkoudaxiao = 1024 * 1024)
    {
        m_dangjianlizhi = 0;
        m_zhijiandeshuju.Clear();
        m_chuangkoudaxiao = chuangkoudaxiao;
    }
    public int PreDecompress(byte[] yuanshishuju, out uint jieyachangdu, out uint shiyongchangdu)
    {
        jieyachangdu = 0;
        shiyongchangdu = 0;
        int dangjianyuan = 0;
        uint changdu = (uint)yuanshishuju.Length;
        while (changdu != 0)
        {
            bool chongfu = (yuanshishuju[dangjianyuan] & 0x80) != 0;
            uint chili;
            uint Value = (uint)(yuanshishuju[dangjianyuan] & 0x3F);
            changdu--;
            dangjianyuan++;
            if ((yuanshishuju[dangjianyuan - 1] & 0x40) != 0)
            {
                chili = 6;
                for (;;)
                {
                    if (0 == changdu) return 0;
                    if (6 + (4 * 8 - 6) / 7 * 7 == chili && yuanshishuju[dangjianyuan] >= 1 << (7 - (4 * 8 - 6) % 7)) return -3;
                    Value |= (uint)(yuanshishuju[dangjianyuan] & 0x7F) << (int)chili;
                    changdu--;
                    dangjianyuan++;
                    if ((yuanshishuju[dangjianyuan - 1] & 0x80) == 0) break;
                    chili += 7;
                    if (chili > 4 * 8) return -3;
                }
            }
            uint chang;
            if (chongfu)
            {
                if (Value > ~(uint)0 - 3) return -3;
                Value += 3;
                if (Value > ~(uint)0 - jieyachangdu) return -3;
                chang = Value;
                Value = 0;
                chili = 0;
                for (;;)
                {
                    if (0 == changdu) return 0;
                    if (4 * 8 / 7 * 7 == chili && yuanshishuju[dangjianyuan] >= 1 << (7 - 4 * 8 % 7)) return -3;
                    Value |= (uint)(yuanshishuju[dangjianyuan] & 0x7F) << (int)chili;
                    changdu--;
                    dangjianyuan++;
                    if ((yuanshishuju[dangjianyuan - 1] & 0x80) == 0) break;
                    chili += 7;
                    if (chili > 4 * 8) return -3;
                }
                if (Value >= m_dangjianlizhi + jieyachangdu) return -1;
                if (Value < m_dangjianlizhi - m_zhijiandeshuju.Count) return -2;
            }
            else
            {
                if (Value > ~(uint)0 - 1) return -3;
                Value++;
                if (Value > ~(uint)0 - jieyachangdu) return -3;
                chang = Value;
                if (changdu < chang) return 0;
                changdu -= chang;
                dangjianyuan += (int)chang;
            }
            shiyongchangdu = (uint)dangjianyuan;
            jieyachangdu += chang;
            if (jieyachangdu > ~(uint)0 - m_dangjianlizhi) return -3;
        }
        return 0;
    }

    public uint Decompress(byte[] yuanshishuju, ref byte[] shuchuhuancun)
    {
        int shuchu = 0;
        int dangjianyuan = 0;
        uint chang;
        uint changdu = (uint)yuanshishuju.Length;
        while (changdu != 0)
        {
            bool chongfu = (yuanshishuju[dangjianyuan] & 0x80) != 0;
            uint chili;
            uint Value = (uint)(yuanshishuju[dangjianyuan] & 0x3F);
            changdu--;
            dangjianyuan++;
            if ((yuanshishuju[dangjianyuan - 1] & 0x40) != 0)
            {
                chili = 6;
                for (;;)
                {
                    Value |= (uint)(yuanshishuju[dangjianyuan] & 0x7F) << (int)chili;
                    changdu--;
                    dangjianyuan++;
                    if ((yuanshishuju[dangjianyuan - 1] & 0x80) == 0) break;
                    chili += 7;
                }
            }
            if (chongfu)
            {
                Value += 3;
                chang = Value;
                Value = 0;
                chili = 0;
                for (;;)
                {
                    Value |= (uint)(yuanshishuju[dangjianyuan] & 0x7F) << (int)chili;
                    changdu--;
                    dangjianyuan++;
                    if ((yuanshishuju[dangjianyuan - 1] & 0x80) == 0) break;
                    chili += 7;
                }
                if (Value < m_dangjianlizhi)
                {
                    uint conghuancunzhongdouqudechangdu = m_dangjianlizhi - Value;
                    if (conghuancunzhongdouqudechangdu > chang) conghuancunzhongdouqudechangdu = chang;
                    m_zhijiandeshuju.CopyTo(m_zhijiandeshuju.Count - (int)(m_dangjianlizhi - Value), shuchuhuancun, shuchu, (int)conghuancunzhongdouqudechangdu);
                    Value += conghuancunzhongdouqudechangdu;
                    chang -= conghuancunzhongdouqudechangdu;
                    shuchu += (int)conghuancunzhongdouqudechangdu;
                }
                while (chang != 0)
                {
                    uint fuzhidechangdu;
                    if ((Value - m_dangjianlizhi) + chang > (uint)shuchu)
                        fuzhidechangdu = (uint)shuchu - (Value - m_dangjianlizhi);
                    else
                        fuzhidechangdu = chang;
                    Array.Copy(shuchuhuancun, Value - m_dangjianlizhi, shuchuhuancun, shuchu, fuzhidechangdu);
                    Value += fuzhidechangdu;
                    chang -= fuzhidechangdu;
                    shuchu += (int)fuzhidechangdu;
                }
            }
            else
            {
                Value++;
                chang = Value;
                Array.Copy(yuanshishuju, dangjianyuan, shuchuhuancun, shuchu, chang);
                changdu -= chang;
                dangjianyuan += (int)chang;
                shuchu += (int)chang;
            }
        }
        chang = (uint)shuchu;
        m_dangjianlizhi += chang;
        if (m_zhijiandeshuju.Count + chang > m_chuangkoudaxiao)
        {
            if (chang > m_chuangkoudaxiao)
            {
                m_zhijiandeshuju.Clear();
                int i;
                for (i = 0; i < m_chuangkoudaxiao; i++)
                    m_zhijiandeshuju.Add(shuchuhuancun[chang - m_chuangkoudaxiao + i]);
            }
            else
            {
                m_zhijiandeshuju.RemoveRange(0, (int)(m_zhijiandeshuju.Count + chang - m_chuangkoudaxiao));
                int i;
                for (i = 0; i < chang; i++)
                    m_zhijiandeshuju.Add(shuchuhuancun[i]);
            }
        }
        else
        {
            int i;
            for (i = 0; i < chang; i++)
                m_zhijiandeshuju.Add(shuchuhuancun[i]);
        }
        return chang;
    }

    uint m_dangjianlizhi;
    List<byte> m_zhijiandeshuju = new List<byte>();
    uint m_chuangkoudaxiao;
}