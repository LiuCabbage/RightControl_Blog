using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace RightControl.Common
{
    public class IPScanerHelper
    {
        private string dataPath;
        private string ip;
        private string country;
        private string local;
        private long firstStartIp = 0L;
        private long lastStartIp = 0L;
        private FileStream objfs = null;
        private long startIp = 0L;
        private long endIp = 0L;
        private int countryFlag = 0;
        private long endIpOff = 0L;
        private string errMsg = null;

        public string DataPath
        {
            set
            {
                this.dataPath = value;
            }
        }

        public string IP
        {
            set
            {
                this.ip = value;
            }
        }

        public string Country
        {
            get
            {
                return this.country;
            }
        }

        public string Local
        {
            get
            {
                return this.local;
            }
        }

        public string ErrMsg
        {
            get
            {
                return this.errMsg;
            }
        }

        private int QQwry()
        {
            string pattern = "(((\\d{1,2})|(1\\d{2})|(2[0-4]\\d)|(25[0-5]))\\.){3}((\\d{1,2})|(1\\d{2})|(2[0-4]\\d)|(25[0-5]))";
            Regex objRe = new Regex(pattern);
            Match objMa = objRe.Match(this.ip);
            int result;
            if (!objMa.Success)
            {
                this.errMsg = "IP格式错误";
                result = 4;
            }
            else
            {
                long ip_Int = this.IpToInt(this.ip);
                int nRet = 0;
                if (ip_Int >= this.IpToInt("127.0.0.0") && ip_Int <= this.IpToInt("127.255.255.255"))
                {
                    this.country = "本机内部环回地址";
                    this.local = "";
                    nRet = 1;
                }
                else
                {
                    if ((ip_Int >= this.IpToInt("0.0.0.0") && ip_Int <= this.IpToInt("2.255.255.255")) || (ip_Int >= this.IpToInt("64.0.0.0") && ip_Int <= this.IpToInt("126.255.255.255")) || (ip_Int >= this.IpToInt("58.0.0.0") && ip_Int <= this.IpToInt("60.255.255.255")))
                    {
                        this.country = "网络保留地址";
                        this.local = "";
                        nRet = 1;
                    }
                }
                this.objfs = new FileStream(this.dataPath, FileMode.Open, FileAccess.Read);
                try
                {
                    this.objfs.Position = 0L;
                    byte[] buff = new byte[8];
                    this.objfs.Read(buff, 0, 8);
                    this.firstStartIp = (long)((int)buff[0] + (int)buff[1] * 256 + (int)buff[2] * 256 * 256 + (int)buff[3] * 256 * 256 * 256);
                    this.lastStartIp = (long)((int)buff[4] + (int)buff[5] * 256 + (int)buff[6] * 256 * 256 + (int)buff[7] * 256 * 256 * 256);
                    long recordCount = Convert.ToInt64((double)(this.lastStartIp - this.firstStartIp) / 7.0);
                    if (recordCount <= 1L)
                    {
                        this.country = "FileDataError";
                        this.objfs.Close();
                        result = 2;
                    }
                    else
                    {
                        long rangE = recordCount;
                        long rangB = 0L;
                        while (rangB < rangE - 1L)
                        {
                            long recNO = (rangE + rangB) / 2L;
                            this.GetStartIp(recNO);
                            if (ip_Int == this.startIp)
                            {
                                rangB = recNO;
                                break;
                            }
                            if (ip_Int > this.startIp)
                            {
                                rangB = recNO;
                            }
                            else
                            {
                                rangE = recNO;
                            }
                        }
                        this.GetStartIp(rangB);
                        this.GetEndIp();
                        if (this.startIp <= ip_Int && this.endIp >= ip_Int)
                        {
                            this.GetCountry();
                            this.local = this.local.Replace("（我们一定要解放台湾！！！）", "");
                        }
                        else
                        {
                            nRet = 3;
                            this.country = "未知";
                            this.local = "";
                        }
                        this.objfs.Close();
                        result = nRet;
                    }
                }
                catch
                {
                    result = 1;
                }
            }
            return result;
        }

        private long IpToInt(string ip)
        {
            char[] dot = new char[]
            {
                '.'
            };
            string[] ipArr = ip.Split(dot);
            if (ipArr.Length == 3)
            {
                ip += ".0";
            }
            ipArr = ip.Split(dot);
            long p = long.Parse(ipArr[0]) * 256L * 256L * 256L;
            long p2 = long.Parse(ipArr[1]) * 256L * 256L;
            long p3 = long.Parse(ipArr[2]) * 256L;
            long p4 = long.Parse(ipArr[3]);
            return p + p2 + p3 + p4;
        }

        private string IntToIP(long ip_Int)
        {
            long seg = (ip_Int & 0xff000000) >> 24;
            if (seg < 0L)
            {
                seg += 0x100;
            }
            long seg2 = (ip_Int & 0x00ff0000) >> 16;
            if (seg2 < 0L)
            {
                seg2 += 0x100;
            }
            long seg3 = (ip_Int & 0x0000ff00) >> 8;
            if (seg3 < 0L)
            {
                seg3 += 0x100;
            }
            long seg4 = ip_Int & 0x000000ff;
            if (seg4 < 0L)
            {
                seg4 += 0x100;
            }
            return string.Concat(new string[]
            {
                seg.ToString(),
                ".",
                seg2.ToString(),
                ".",
                seg3.ToString(),
                ".",
                seg4.ToString()
            });
        }

        private long GetStartIp(long recNO)
        {
            long offSet = this.firstStartIp + recNO * 7L;
            this.objfs.Position = offSet;
            byte[] buff = new byte[7];
            this.objfs.Read(buff, 0, 7);
            this.endIpOff = Convert.ToInt64(buff[4].ToString()) + Convert.ToInt64(buff[5].ToString()) * 256L + Convert.ToInt64(buff[6].ToString()) * 256L * 256L;
            this.startIp = Convert.ToInt64(buff[0].ToString()) + Convert.ToInt64(buff[1].ToString()) * 256L + Convert.ToInt64(buff[2].ToString()) * 256L * 256L + Convert.ToInt64(buff[3].ToString()) * 256L * 256L * 256L;
            return this.startIp;
        }

        private long GetEndIp()
        {
            this.objfs.Position = this.endIpOff;
            byte[] buff = new byte[5];
            this.objfs.Read(buff, 0, 5);
            this.endIp = Convert.ToInt64(buff[0].ToString()) + Convert.ToInt64(buff[1].ToString()) * 256L + Convert.ToInt64(buff[2].ToString()) * 256L * 256L + Convert.ToInt64(buff[3].ToString()) * 256L * 256L * 256L;
            this.countryFlag = (int)buff[4];
            return this.endIp;
        }

        private string GetCountry()
        {
            switch (this.countryFlag)
            {
                case 1:
                case 2:
                    this.country = this.GetFlagStr(this.endIpOff + 4L);
                    this.local = ((1 == this.countryFlag) ? " " : this.GetFlagStr(this.endIpOff + 8L));
                    break;

                default:
                    this.country = this.GetFlagStr(this.endIpOff + 4L);
                    this.local = this.GetFlagStr(this.objfs.Position);
                    break;
            }
            return " ";
        }

        private string GetFlagStr(long offSet)
        {
            byte[] buff = new byte[3];
            while (true)
            {
                this.objfs.Position = offSet;
                int flag = this.objfs.ReadByte();
                if (flag != 1 && flag != 2)
                {
                    break;
                }
                this.objfs.Read(buff, 0, 3);
                if (flag == 2)
                {
                    this.countryFlag = 2;
                    this.endIpOff = offSet - 4L;
                }
                offSet = Convert.ToInt64(buff[0].ToString()) + Convert.ToInt64(buff[1].ToString()) * 256L + Convert.ToInt64(buff[2].ToString()) * 256L * 256L;
            }
            string result;
            if (offSet < 12L)
            {
                result = " ";
            }
            else
            {
                this.objfs.Position = offSet;
                result = this.GetStr();
            }
            return result;
        }

        private string GetStr()
        {
            string str = "";
            byte[] buff = new byte[2];
            while (true)
            {
                byte lowC = (byte)this.objfs.ReadByte();
                if (lowC == 0)
                {
                    break;
                }
                if (lowC > 127)
                {
                    byte upC = (byte)this.objfs.ReadByte();
                    buff[0] = lowC;
                    buff[1] = upC;
                    Encoding enc = Encoding.GetEncoding("GB2312");
                    str += enc.GetString(buff);
                }
                else
                {
                    str += (char)lowC;
                }
            }
            return str;
        }

        public string IPLocation()
        {
            this.QQwry();
            return this.country + this.local;
        }

        public string IPLocation(string dataPath, string ip)
        {
            this.dataPath = dataPath;
            this.ip = ip;
            this.QQwry();
            return this.country + this.local;
        }
    }
}
