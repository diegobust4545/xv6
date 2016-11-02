
_getcount:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"
#include "syscall.h"

int
main(void){
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	83 e4 f0             	and    $0xfffffff0,%esp
    1006:	83 ec 10             	sub    $0x10,%esp
	printf(1, "Number of System Calls: %d\n", getcount());
    1009:	e8 cc 02 00 00       	call   12da <getcount>
    100e:	c7 44 24 04 26 17 00 	movl   $0x1726,0x4(%esp)
    1015:	00 
    1016:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    101d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1021:	e8 9a 03 00 00       	call   13c0 <printf>
  exit();
    1026:	e8 27 02 00 00       	call   1252 <exit>
    102b:	66 90                	xchg   %ax,%ax
    102d:	66 90                	xchg   %ax,%ax
    102f:	90                   	nop

00001030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	8b 45 08             	mov    0x8(%ebp),%eax
    1036:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1039:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    103a:	89 c2                	mov    %eax,%edx
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1040:	83 c1 01             	add    $0x1,%ecx
    1043:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1047:	83 c2 01             	add    $0x1,%edx
    104a:	84 db                	test   %bl,%bl
    104c:	88 5a ff             	mov    %bl,-0x1(%edx)
    104f:	75 ef                	jne    1040 <strcpy+0x10>
    ;
  return os;
}
    1051:	5b                   	pop    %ebx
    1052:	5d                   	pop    %ebp
    1053:	c3                   	ret    
    1054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    105a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	8b 55 08             	mov    0x8(%ebp),%edx
    1066:	53                   	push   %ebx
    1067:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    106a:	0f b6 02             	movzbl (%edx),%eax
    106d:	84 c0                	test   %al,%al
    106f:	74 2d                	je     109e <strcmp+0x3e>
    1071:	0f b6 19             	movzbl (%ecx),%ebx
    1074:	38 d8                	cmp    %bl,%al
    1076:	74 0e                	je     1086 <strcmp+0x26>
    1078:	eb 2b                	jmp    10a5 <strcmp+0x45>
    107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1080:	38 c8                	cmp    %cl,%al
    1082:	75 15                	jne    1099 <strcmp+0x39>
    p++, q++;
    1084:	89 d9                	mov    %ebx,%ecx
    1086:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1089:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    108c:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    108f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1093:	84 c0                	test   %al,%al
    1095:	75 e9                	jne    1080 <strcmp+0x20>
    1097:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1099:	29 c8                	sub    %ecx,%eax
}
    109b:	5b                   	pop    %ebx
    109c:	5d                   	pop    %ebp
    109d:	c3                   	ret    
    109e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    10a1:	31 c0                	xor    %eax,%eax
    10a3:	eb f4                	jmp    1099 <strcmp+0x39>
    10a5:	0f b6 cb             	movzbl %bl,%ecx
    10a8:	eb ef                	jmp    1099 <strcmp+0x39>
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000010b0 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    10b6:	80 39 00             	cmpb   $0x0,(%ecx)
    10b9:	74 12                	je     10cd <strlen+0x1d>
    10bb:	31 d2                	xor    %edx,%edx
    10bd:	8d 76 00             	lea    0x0(%esi),%esi
    10c0:	83 c2 01             	add    $0x1,%edx
    10c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    10c7:	89 d0                	mov    %edx,%eax
    10c9:	75 f5                	jne    10c0 <strlen+0x10>
    ;
  return n;
}
    10cb:	5d                   	pop    %ebp
    10cc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    10cd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    10cf:	5d                   	pop    %ebp
    10d0:	c3                   	ret    
    10d1:	eb 0d                	jmp    10e0 <memset>
    10d3:	90                   	nop
    10d4:	90                   	nop
    10d5:	90                   	nop
    10d6:	90                   	nop
    10d7:	90                   	nop
    10d8:	90                   	nop
    10d9:	90                   	nop
    10da:	90                   	nop
    10db:	90                   	nop
    10dc:	90                   	nop
    10dd:	90                   	nop
    10de:	90                   	nop
    10df:	90                   	nop

000010e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	8b 55 08             	mov    0x8(%ebp),%edx
    10e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    10e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    10ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ed:	89 d7                	mov    %edx,%edi
    10ef:	fc                   	cld    
    10f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    10f2:	89 d0                	mov    %edx,%eax
    10f4:	5f                   	pop    %edi
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret    
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <strchr>:

char*
strchr(const char *s, char c)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	8b 45 08             	mov    0x8(%ebp),%eax
    1106:	53                   	push   %ebx
    1107:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    110a:	0f b6 18             	movzbl (%eax),%ebx
    110d:	84 db                	test   %bl,%bl
    110f:	74 1d                	je     112e <strchr+0x2e>
    if(*s == c)
    1111:	38 d3                	cmp    %dl,%bl
    1113:	89 d1                	mov    %edx,%ecx
    1115:	75 0d                	jne    1124 <strchr+0x24>
    1117:	eb 17                	jmp    1130 <strchr+0x30>
    1119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1120:	38 ca                	cmp    %cl,%dl
    1122:	74 0c                	je     1130 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1124:	83 c0 01             	add    $0x1,%eax
    1127:	0f b6 10             	movzbl (%eax),%edx
    112a:	84 d2                	test   %dl,%dl
    112c:	75 f2                	jne    1120 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    112e:	31 c0                	xor    %eax,%eax
}
    1130:	5b                   	pop    %ebx
    1131:	5d                   	pop    %ebp
    1132:	c3                   	ret    
    1133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <gets>:

char*
gets(char *buf, int max)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1145:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
    1147:	53                   	push   %ebx
    1148:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    114b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    114e:	eb 31                	jmp    1181 <gets+0x41>
    cc = read(0, &c, 1);
    1150:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1157:	00 
    1158:	89 7c 24 04          	mov    %edi,0x4(%esp)
    115c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1163:	e8 02 01 00 00       	call   126a <read>
    if(cc < 1)
    1168:	85 c0                	test   %eax,%eax
    116a:	7e 1d                	jle    1189 <gets+0x49>
      break;
    buf[i++] = c;
    116c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1170:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    1172:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1175:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    1177:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    117b:	74 0c                	je     1189 <gets+0x49>
    117d:	3c 0a                	cmp    $0xa,%al
    117f:	74 08                	je     1189 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1181:	8d 5e 01             	lea    0x1(%esi),%ebx
    1184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1187:	7c c7                	jl     1150 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1189:	8b 45 08             	mov    0x8(%ebp),%eax
    118c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1190:	83 c4 2c             	add    $0x2c,%esp
    1193:	5b                   	pop    %ebx
    1194:	5e                   	pop    %esi
    1195:	5f                   	pop    %edi
    1196:	5d                   	pop    %ebp
    1197:	c3                   	ret    
    1198:	90                   	nop
    1199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011a0 <stat>:

int
stat(char *n, struct stat *st)
{
    11a0:	55                   	push   %ebp
    11a1:	89 e5                	mov    %esp,%ebp
    11a3:	56                   	push   %esi
    11a4:	53                   	push   %ebx
    11a5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11a8:	8b 45 08             	mov    0x8(%ebp),%eax
    11ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    11b2:	00 
    11b3:	89 04 24             	mov    %eax,(%esp)
    11b6:	e8 d7 00 00 00       	call   1292 <open>
  if(fd < 0)
    11bb:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11bd:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    11bf:	78 27                	js     11e8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    11c1:	8b 45 0c             	mov    0xc(%ebp),%eax
    11c4:	89 1c 24             	mov    %ebx,(%esp)
    11c7:	89 44 24 04          	mov    %eax,0x4(%esp)
    11cb:	e8 da 00 00 00       	call   12aa <fstat>
  close(fd);
    11d0:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
    11d3:	89 c6                	mov    %eax,%esi
  close(fd);
    11d5:	e8 a0 00 00 00       	call   127a <close>
  return r;
    11da:	89 f0                	mov    %esi,%eax
}
    11dc:	83 c4 10             	add    $0x10,%esp
    11df:	5b                   	pop    %ebx
    11e0:	5e                   	pop    %esi
    11e1:	5d                   	pop    %ebp
    11e2:	c3                   	ret    
    11e3:	90                   	nop
    11e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    11e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    11ed:	eb ed                	jmp    11dc <stat+0x3c>
    11ef:	90                   	nop

000011f0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11f6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    11f7:	0f be 11             	movsbl (%ecx),%edx
    11fa:	8d 42 d0             	lea    -0x30(%edx),%eax
    11fd:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
    11ff:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1204:	77 17                	ja     121d <atoi+0x2d>
    1206:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    1208:	83 c1 01             	add    $0x1,%ecx
    120b:	8d 04 80             	lea    (%eax,%eax,4),%eax
    120e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1212:	0f be 11             	movsbl (%ecx),%edx
    1215:	8d 5a d0             	lea    -0x30(%edx),%ebx
    1218:	80 fb 09             	cmp    $0x9,%bl
    121b:	76 eb                	jbe    1208 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
    121d:	5b                   	pop    %ebx
    121e:	5d                   	pop    %ebp
    121f:	c3                   	ret    

00001220 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1220:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1221:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    1223:	89 e5                	mov    %esp,%ebp
    1225:	56                   	push   %esi
    1226:	8b 45 08             	mov    0x8(%ebp),%eax
    1229:	53                   	push   %ebx
    122a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    122d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1230:	85 db                	test   %ebx,%ebx
    1232:	7e 12                	jle    1246 <memmove+0x26>
    1234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1238:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    123c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    123f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1242:	39 da                	cmp    %ebx,%edx
    1244:	75 f2                	jne    1238 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1246:	5b                   	pop    %ebx
    1247:	5e                   	pop    %esi
    1248:	5d                   	pop    %ebp
    1249:	c3                   	ret    

0000124a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    124a:	b8 01 00 00 00       	mov    $0x1,%eax
    124f:	cd 40                	int    $0x40
    1251:	c3                   	ret    

00001252 <exit>:
SYSCALL(exit)
    1252:	b8 02 00 00 00       	mov    $0x2,%eax
    1257:	cd 40                	int    $0x40
    1259:	c3                   	ret    

0000125a <wait>:
SYSCALL(wait)
    125a:	b8 03 00 00 00       	mov    $0x3,%eax
    125f:	cd 40                	int    $0x40
    1261:	c3                   	ret    

00001262 <pipe>:
SYSCALL(pipe)
    1262:	b8 04 00 00 00       	mov    $0x4,%eax
    1267:	cd 40                	int    $0x40
    1269:	c3                   	ret    

0000126a <read>:
SYSCALL(read)
    126a:	b8 05 00 00 00       	mov    $0x5,%eax
    126f:	cd 40                	int    $0x40
    1271:	c3                   	ret    

00001272 <write>:
SYSCALL(write)
    1272:	b8 10 00 00 00       	mov    $0x10,%eax
    1277:	cd 40                	int    $0x40
    1279:	c3                   	ret    

0000127a <close>:
SYSCALL(close)
    127a:	b8 15 00 00 00       	mov    $0x15,%eax
    127f:	cd 40                	int    $0x40
    1281:	c3                   	ret    

00001282 <kill>:
SYSCALL(kill)
    1282:	b8 06 00 00 00       	mov    $0x6,%eax
    1287:	cd 40                	int    $0x40
    1289:	c3                   	ret    

0000128a <exec>:
SYSCALL(exec)
    128a:	b8 07 00 00 00       	mov    $0x7,%eax
    128f:	cd 40                	int    $0x40
    1291:	c3                   	ret    

00001292 <open>:
SYSCALL(open)
    1292:	b8 0f 00 00 00       	mov    $0xf,%eax
    1297:	cd 40                	int    $0x40
    1299:	c3                   	ret    

0000129a <mknod>:
SYSCALL(mknod)
    129a:	b8 11 00 00 00       	mov    $0x11,%eax
    129f:	cd 40                	int    $0x40
    12a1:	c3                   	ret    

000012a2 <unlink>:
SYSCALL(unlink)
    12a2:	b8 12 00 00 00       	mov    $0x12,%eax
    12a7:	cd 40                	int    $0x40
    12a9:	c3                   	ret    

000012aa <fstat>:
SYSCALL(fstat)
    12aa:	b8 08 00 00 00       	mov    $0x8,%eax
    12af:	cd 40                	int    $0x40
    12b1:	c3                   	ret    

000012b2 <link>:
SYSCALL(link)
    12b2:	b8 13 00 00 00       	mov    $0x13,%eax
    12b7:	cd 40                	int    $0x40
    12b9:	c3                   	ret    

000012ba <mkdir>:
SYSCALL(mkdir)
    12ba:	b8 14 00 00 00       	mov    $0x14,%eax
    12bf:	cd 40                	int    $0x40
    12c1:	c3                   	ret    

000012c2 <chdir>:
SYSCALL(chdir)
    12c2:	b8 09 00 00 00       	mov    $0x9,%eax
    12c7:	cd 40                	int    $0x40
    12c9:	c3                   	ret    

000012ca <dup>:
SYSCALL(dup)
    12ca:	b8 0a 00 00 00       	mov    $0xa,%eax
    12cf:	cd 40                	int    $0x40
    12d1:	c3                   	ret    

000012d2 <getpid>:
SYSCALL(getpid)
    12d2:	b8 0b 00 00 00       	mov    $0xb,%eax
    12d7:	cd 40                	int    $0x40
    12d9:	c3                   	ret    

000012da <getcount>:

# Here
SYSCALL(getcount)
    12da:	b8 16 00 00 00       	mov    $0x16,%eax
    12df:	cd 40                	int    $0x40
    12e1:	c3                   	ret    

000012e2 <getpinfo>:
# Here 2
SYSCALL(getpinfo)
    12e2:	b8 17 00 00 00       	mov    $0x17,%eax
    12e7:	cd 40                	int    $0x40
    12e9:	c3                   	ret    

000012ea <uppriority>:
# Here 3
SYSCALL(uppriority)
    12ea:	b8 18 00 00 00       	mov    $0x18,%eax
    12ef:	cd 40                	int    $0x40
    12f1:	c3                   	ret    

000012f2 <dereference>:
# Here 4
SYSCALL(dereference)
    12f2:	b8 19 00 00 00       	mov    $0x19,%eax
    12f7:	cd 40                	int    $0x40
    12f9:	c3                   	ret    

000012fa <sbrk>:

SYSCALL(sbrk)
    12fa:	b8 0c 00 00 00       	mov    $0xc,%eax
    12ff:	cd 40                	int    $0x40
    1301:	c3                   	ret    

00001302 <sleep>:
SYSCALL(sleep)
    1302:	b8 0d 00 00 00       	mov    $0xd,%eax
    1307:	cd 40                	int    $0x40
    1309:	c3                   	ret    

0000130a <uptime>:
SYSCALL(uptime)
    130a:	b8 0e 00 00 00       	mov    $0xe,%eax
    130f:	cd 40                	int    $0x40
    1311:	c3                   	ret    
    1312:	66 90                	xchg   %ax,%ax
    1314:	66 90                	xchg   %ax,%ax
    1316:	66 90                	xchg   %ax,%ax
    1318:	66 90                	xchg   %ax,%ax
    131a:	66 90                	xchg   %ax,%ax
    131c:	66 90                	xchg   %ax,%ax
    131e:	66 90                	xchg   %ax,%ax

00001320 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	57                   	push   %edi
    1324:	56                   	push   %esi
    1325:	89 c6                	mov    %eax,%esi
    1327:	53                   	push   %ebx
    1328:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    132b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    132e:	85 db                	test   %ebx,%ebx
    1330:	74 09                	je     133b <printint+0x1b>
    1332:	89 d0                	mov    %edx,%eax
    1334:	c1 e8 1f             	shr    $0x1f,%eax
    1337:	84 c0                	test   %al,%al
    1339:	75 75                	jne    13b0 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    133b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    133d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1344:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
    1347:	31 ff                	xor    %edi,%edi
    1349:	89 ce                	mov    %ecx,%esi
    134b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    134e:	eb 02                	jmp    1352 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1350:	89 cf                	mov    %ecx,%edi
    1352:	31 d2                	xor    %edx,%edx
    1354:	f7 f6                	div    %esi
    1356:	8d 4f 01             	lea    0x1(%edi),%ecx
    1359:	0f b6 92 49 17 00 00 	movzbl 0x1749(%edx),%edx
  }while((x /= base) != 0);
    1360:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    1362:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1365:	75 e9                	jne    1350 <printint+0x30>
  if(neg)
    1367:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    136a:	89 c8                	mov    %ecx,%eax
    136c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
    136f:	85 d2                	test   %edx,%edx
    1371:	74 08                	je     137b <printint+0x5b>
    buf[i++] = '-';
    1373:	8d 4f 02             	lea    0x2(%edi),%ecx
    1376:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    137b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    137e:	66 90                	xchg   %ax,%ax
    1380:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1385:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1388:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    138f:	00 
    1390:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1394:	89 34 24             	mov    %esi,(%esp)
    1397:	88 45 d7             	mov    %al,-0x29(%ebp)
    139a:	e8 d3 fe ff ff       	call   1272 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    139f:	83 ff ff             	cmp    $0xffffffff,%edi
    13a2:	75 dc                	jne    1380 <printint+0x60>
    putc(fd, buf[i]);
}
    13a4:	83 c4 4c             	add    $0x4c,%esp
    13a7:	5b                   	pop    %ebx
    13a8:	5e                   	pop    %esi
    13a9:	5f                   	pop    %edi
    13aa:	5d                   	pop    %ebp
    13ab:	c3                   	ret    
    13ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    13b0:	89 d0                	mov    %edx,%eax
    13b2:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    13b4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    13bb:	eb 87                	jmp    1344 <printint+0x24>
    13bd:	8d 76 00             	lea    0x0(%esi),%esi

000013c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    13c4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13c6:	56                   	push   %esi
    13c7:	53                   	push   %ebx
    13c8:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13cb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    13ce:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    13d1:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    13d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    13d7:	0f b6 13             	movzbl (%ebx),%edx
    13da:	83 c3 01             	add    $0x1,%ebx
    13dd:	84 d2                	test   %dl,%dl
    13df:	75 39                	jne    141a <printf+0x5a>
    13e1:	e9 c2 00 00 00       	jmp    14a8 <printf+0xe8>
    13e6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    13e8:	83 fa 25             	cmp    $0x25,%edx
    13eb:	0f 84 bf 00 00 00    	je     14b0 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13f1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    13f4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    13fb:	00 
    13fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1400:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    1403:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1406:	e8 67 fe ff ff       	call   1272 <write>
    140b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    140e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    1412:	84 d2                	test   %dl,%dl
    1414:	0f 84 8e 00 00 00    	je     14a8 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
    141a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    141c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    141f:	74 c7                	je     13e8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1421:	83 ff 25             	cmp    $0x25,%edi
    1424:	75 e5                	jne    140b <printf+0x4b>
      if(c == 'd'){
    1426:	83 fa 64             	cmp    $0x64,%edx
    1429:	0f 84 31 01 00 00    	je     1560 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    142f:	25 f7 00 00 00       	and    $0xf7,%eax
    1434:	83 f8 70             	cmp    $0x70,%eax
    1437:	0f 84 83 00 00 00    	je     14c0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    143d:	83 fa 73             	cmp    $0x73,%edx
    1440:	0f 84 a2 00 00 00    	je     14e8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1446:	83 fa 63             	cmp    $0x63,%edx
    1449:	0f 84 35 01 00 00    	je     1584 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    144f:	83 fa 25             	cmp    $0x25,%edx
    1452:	0f 84 e0 00 00 00    	je     1538 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1458:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    145b:	83 c3 01             	add    $0x1,%ebx
    145e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1465:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1466:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1468:	89 44 24 04          	mov    %eax,0x4(%esp)
    146c:	89 34 24             	mov    %esi,(%esp)
    146f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1472:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1476:	e8 f7 fd ff ff       	call   1272 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    147b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    147e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1481:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1488:	00 
    1489:	89 44 24 04          	mov    %eax,0x4(%esp)
    148d:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    1490:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1493:	e8 da fd ff ff       	call   1272 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1498:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    149c:	84 d2                	test   %dl,%dl
    149e:	0f 85 76 ff ff ff    	jne    141a <printf+0x5a>
    14a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    14a8:	83 c4 3c             	add    $0x3c,%esp
    14ab:	5b                   	pop    %ebx
    14ac:	5e                   	pop    %esi
    14ad:	5f                   	pop    %edi
    14ae:	5d                   	pop    %ebp
    14af:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    14b0:	bf 25 00 00 00       	mov    $0x25,%edi
    14b5:	e9 51 ff ff ff       	jmp    140b <printf+0x4b>
    14ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    14c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    14c3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14c8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    14ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    14d1:	8b 10                	mov    (%eax),%edx
    14d3:	89 f0                	mov    %esi,%eax
    14d5:	e8 46 fe ff ff       	call   1320 <printint>
        ap++;
    14da:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    14de:	e9 28 ff ff ff       	jmp    140b <printf+0x4b>
    14e3:	90                   	nop
    14e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    14e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    14eb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    14ef:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
    14f1:	b8 42 17 00 00       	mov    $0x1742,%eax
    14f6:	85 ff                	test   %edi,%edi
    14f8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    14fb:	0f b6 07             	movzbl (%edi),%eax
    14fe:	84 c0                	test   %al,%al
    1500:	74 2a                	je     152c <printf+0x16c>
    1502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1508:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    150b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    150e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1511:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1518:	00 
    1519:	89 44 24 04          	mov    %eax,0x4(%esp)
    151d:	89 34 24             	mov    %esi,(%esp)
    1520:	e8 4d fd ff ff       	call   1272 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1525:	0f b6 07             	movzbl (%edi),%eax
    1528:	84 c0                	test   %al,%al
    152a:	75 dc                	jne    1508 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    152c:	31 ff                	xor    %edi,%edi
    152e:	e9 d8 fe ff ff       	jmp    140b <printf+0x4b>
    1533:	90                   	nop
    1534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1538:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    153b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    153d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1544:	00 
    1545:	89 44 24 04          	mov    %eax,0x4(%esp)
    1549:	89 34 24             	mov    %esi,(%esp)
    154c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1550:	e8 1d fd ff ff       	call   1272 <write>
    1555:	e9 b1 fe ff ff       	jmp    140b <printf+0x4b>
    155a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1560:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1563:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1568:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    156b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1572:	8b 10                	mov    (%eax),%edx
    1574:	89 f0                	mov    %esi,%eax
    1576:	e8 a5 fd ff ff       	call   1320 <printint>
        ap++;
    157b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    157f:	e9 87 fe ff ff       	jmp    140b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1584:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1587:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1589:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    158b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1592:	00 
    1593:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1596:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1599:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    159c:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a0:	e8 cd fc ff ff       	call   1272 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
    15a5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15a9:	e9 5d fe ff ff       	jmp    140b <printf+0x4b>
    15ae:	66 90                	xchg   %ax,%ax

000015b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15b1:	a1 c0 19 00 00       	mov    0x19c0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    15b6:	89 e5                	mov    %esp,%ebp
    15b8:	57                   	push   %edi
    15b9:	56                   	push   %esi
    15ba:	53                   	push   %ebx
    15bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15be:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    15c0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15c3:	39 d0                	cmp    %edx,%eax
    15c5:	72 11                	jb     15d8 <free+0x28>
    15c7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15c8:	39 c8                	cmp    %ecx,%eax
    15ca:	72 04                	jb     15d0 <free+0x20>
    15cc:	39 ca                	cmp    %ecx,%edx
    15ce:	72 10                	jb     15e0 <free+0x30>
    15d0:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15d4:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15d6:	73 f0                	jae    15c8 <free+0x18>
    15d8:	39 ca                	cmp    %ecx,%edx
    15da:	72 04                	jb     15e0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    15dc:	39 c8                	cmp    %ecx,%eax
    15de:	72 f0                	jb     15d0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    15e0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    15e3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    15e6:	39 cf                	cmp    %ecx,%edi
    15e8:	74 1e                	je     1608 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    15ea:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    15ed:	8b 48 04             	mov    0x4(%eax),%ecx
    15f0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    15f3:	39 f2                	cmp    %esi,%edx
    15f5:	74 28                	je     161f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    15f7:	89 10                	mov    %edx,(%eax)
  freep = p;
    15f9:	a3 c0 19 00 00       	mov    %eax,0x19c0
}
    15fe:	5b                   	pop    %ebx
    15ff:	5e                   	pop    %esi
    1600:	5f                   	pop    %edi
    1601:	5d                   	pop    %ebp
    1602:	c3                   	ret    
    1603:	90                   	nop
    1604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1608:	03 71 04             	add    0x4(%ecx),%esi
    160b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    160e:	8b 08                	mov    (%eax),%ecx
    1610:	8b 09                	mov    (%ecx),%ecx
    1612:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1615:	8b 48 04             	mov    0x4(%eax),%ecx
    1618:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    161b:	39 f2                	cmp    %esi,%edx
    161d:	75 d8                	jne    15f7 <free+0x47>
    p->s.size += bp->s.size;
    161f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    1622:	a3 c0 19 00 00       	mov    %eax,0x19c0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1627:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    162a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    162d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    162f:	5b                   	pop    %ebx
    1630:	5e                   	pop    %esi
    1631:	5f                   	pop    %edi
    1632:	5d                   	pop    %ebp
    1633:	c3                   	ret    
    1634:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    163a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1640:	55                   	push   %ebp
    1641:	89 e5                	mov    %esp,%ebp
    1643:	57                   	push   %edi
    1644:	56                   	push   %esi
    1645:	53                   	push   %ebx
    1646:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1649:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    164c:	8b 1d c0 19 00 00    	mov    0x19c0,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1652:	8d 48 07             	lea    0x7(%eax),%ecx
    1655:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1658:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    165a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    165d:	0f 84 9b 00 00 00    	je     16fe <malloc+0xbe>
    1663:	8b 13                	mov    (%ebx),%edx
    1665:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1668:	39 fe                	cmp    %edi,%esi
    166a:	76 64                	jbe    16d0 <malloc+0x90>
    166c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1673:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1678:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    167b:	eb 0e                	jmp    168b <malloc+0x4b>
    167d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1680:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1682:	8b 78 04             	mov    0x4(%eax),%edi
    1685:	39 fe                	cmp    %edi,%esi
    1687:	76 4f                	jbe    16d8 <malloc+0x98>
    1689:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    168b:	3b 15 c0 19 00 00    	cmp    0x19c0,%edx
    1691:	75 ed                	jne    1680 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1693:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1696:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    169c:	bf 00 10 00 00       	mov    $0x1000,%edi
    16a1:	0f 43 fe             	cmovae %esi,%edi
    16a4:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    16a7:	89 04 24             	mov    %eax,(%esp)
    16aa:	e8 4b fc ff ff       	call   12fa <sbrk>
  if(p == (char*)-1)
    16af:	83 f8 ff             	cmp    $0xffffffff,%eax
    16b2:	74 18                	je     16cc <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    16b4:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    16b7:	83 c0 08             	add    $0x8,%eax
    16ba:	89 04 24             	mov    %eax,(%esp)
    16bd:	e8 ee fe ff ff       	call   15b0 <free>
  return freep;
    16c2:	8b 15 c0 19 00 00    	mov    0x19c0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    16c8:	85 d2                	test   %edx,%edx
    16ca:	75 b4                	jne    1680 <malloc+0x40>
        return 0;
    16cc:	31 c0                	xor    %eax,%eax
    16ce:	eb 20                	jmp    16f0 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    16d0:	89 d0                	mov    %edx,%eax
    16d2:	89 da                	mov    %ebx,%edx
    16d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    16d8:	39 fe                	cmp    %edi,%esi
    16da:	74 1c                	je     16f8 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    16dc:	29 f7                	sub    %esi,%edi
    16de:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    16e1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    16e4:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
    16e7:	89 15 c0 19 00 00    	mov    %edx,0x19c0
      return (void*)(p + 1);
    16ed:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    16f0:	83 c4 1c             	add    $0x1c,%esp
    16f3:	5b                   	pop    %ebx
    16f4:	5e                   	pop    %esi
    16f5:	5f                   	pop    %edi
    16f6:	5d                   	pop    %ebp
    16f7:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    16f8:	8b 08                	mov    (%eax),%ecx
    16fa:	89 0a                	mov    %ecx,(%edx)
    16fc:	eb e9                	jmp    16e7 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    16fe:	c7 05 c0 19 00 00 c4 	movl   $0x19c4,0x19c0
    1705:	19 00 00 
    base.s.size = 0;
    1708:	ba c4 19 00 00       	mov    $0x19c4,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    170d:	c7 05 c4 19 00 00 c4 	movl   $0x19c4,0x19c4
    1714:	19 00 00 
    base.s.size = 0;
    1717:	c7 05 c8 19 00 00 00 	movl   $0x0,0x19c8
    171e:	00 00 00 
    1721:	e9 46 ff ff ff       	jmp    166c <malloc+0x2c>