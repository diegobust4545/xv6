
_init:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	53                   	push   %ebx
    1004:	83 e4 f0             	and    $0xfffffff0,%esp
    1007:	83 ec 10             	sub    $0x10,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    100a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1011:	00 
    1012:	c7 04 24 06 18 00 00 	movl   $0x1806,(%esp)
    1019:	e8 54 03 00 00       	call   1372 <open>
    101e:	85 c0                	test   %eax,%eax
    1020:	0f 88 ac 00 00 00    	js     10d2 <main+0xd2>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    1026:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    102d:	e8 78 03 00 00       	call   13aa <dup>
  dup(0);  // stderr
    1032:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1039:	e8 6c 03 00 00       	call   13aa <dup>
    103e:	66 90                	xchg   %ax,%ax

  for(;;){
    printf(1, "init: starting sh\n");
    1040:	c7 44 24 04 0e 18 00 	movl   $0x180e,0x4(%esp)
    1047:	00 
    1048:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    104f:	e8 4c 04 00 00       	call   14a0 <printf>
    pid = fork();
    1054:	e8 d1 02 00 00       	call   132a <fork>
    if(pid < 0){
    1059:	85 c0                	test   %eax,%eax
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    105b:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    105d:	78 2d                	js     108c <main+0x8c>
    105f:	90                   	nop
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
    1060:	74 43                	je     10a5 <main+0xa5>
    1062:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    1068:	e8 cd 02 00 00       	call   133a <wait>
    106d:	85 c0                	test   %eax,%eax
    106f:	90                   	nop
    1070:	78 ce                	js     1040 <main+0x40>
    1072:	39 d8                	cmp    %ebx,%eax
    1074:	74 ca                	je     1040 <main+0x40>
      printf(1, "zombie!\n");
    1076:	c7 44 24 04 4d 18 00 	movl   $0x184d,0x4(%esp)
    107d:	00 
    107e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1085:	e8 16 04 00 00       	call   14a0 <printf>
    108a:	eb dc                	jmp    1068 <main+0x68>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
    108c:	c7 44 24 04 21 18 00 	movl   $0x1821,0x4(%esp)
    1093:	00 
    1094:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    109b:	e8 00 04 00 00       	call   14a0 <printf>
      exit();
    10a0:	e8 8d 02 00 00       	call   1332 <exit>
    }
    if(pid == 0){
      exec("sh", argv);
    10a5:	c7 44 24 04 d4 1a 00 	movl   $0x1ad4,0x4(%esp)
    10ac:	00 
    10ad:	c7 04 24 34 18 00 00 	movl   $0x1834,(%esp)
    10b4:	e8 b1 02 00 00       	call   136a <exec>
      printf(1, "init: exec sh failed\n");
    10b9:	c7 44 24 04 37 18 00 	movl   $0x1837,0x4(%esp)
    10c0:	00 
    10c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10c8:	e8 d3 03 00 00       	call   14a0 <printf>
      exit();
    10cd:	e8 60 02 00 00       	call   1332 <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    10d2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    10d9:	00 
    10da:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    10e1:	00 
    10e2:	c7 04 24 06 18 00 00 	movl   $0x1806,(%esp)
    10e9:	e8 8c 02 00 00       	call   137a <mknod>
    open("console", O_RDWR);
    10ee:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    10f5:	00 
    10f6:	c7 04 24 06 18 00 00 	movl   $0x1806,(%esp)
    10fd:	e8 70 02 00 00       	call   1372 <open>
    1102:	e9 1f ff ff ff       	jmp    1026 <main+0x26>
    1107:	66 90                	xchg   %ax,%ax
    1109:	66 90                	xchg   %ax,%ax
    110b:	66 90                	xchg   %ax,%ax
    110d:	66 90                	xchg   %ax,%ax
    110f:	90                   	nop

00001110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	8b 45 08             	mov    0x8(%ebp),%eax
    1116:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    1119:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    111a:	89 c2                	mov    %eax,%edx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1120:	83 c1 01             	add    $0x1,%ecx
    1123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    1127:	83 c2 01             	add    $0x1,%edx
    112a:	84 db                	test   %bl,%bl
    112c:	88 5a ff             	mov    %bl,-0x1(%edx)
    112f:	75 ef                	jne    1120 <strcpy+0x10>
    ;
  return os;
}
    1131:	5b                   	pop    %ebx
    1132:	5d                   	pop    %ebp
    1133:	c3                   	ret    
    1134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    113a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	8b 55 08             	mov    0x8(%ebp),%edx
    1146:	53                   	push   %ebx
    1147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    114a:	0f b6 02             	movzbl (%edx),%eax
    114d:	84 c0                	test   %al,%al
    114f:	74 2d                	je     117e <strcmp+0x3e>
    1151:	0f b6 19             	movzbl (%ecx),%ebx
    1154:	38 d8                	cmp    %bl,%al
    1156:	74 0e                	je     1166 <strcmp+0x26>
    1158:	eb 2b                	jmp    1185 <strcmp+0x45>
    115a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1160:	38 c8                	cmp    %cl,%al
    1162:	75 15                	jne    1179 <strcmp+0x39>
    p++, q++;
    1164:	89 d9                	mov    %ebx,%ecx
    1166:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1169:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    116c:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    116f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
    1173:	84 c0                	test   %al,%al
    1175:	75 e9                	jne    1160 <strcmp+0x20>
    1177:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    1179:	29 c8                	sub    %ecx,%eax
}
    117b:	5b                   	pop    %ebx
    117c:	5d                   	pop    %ebp
    117d:	c3                   	ret    
    117e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    1181:	31 c0                	xor    %eax,%eax
    1183:	eb f4                	jmp    1179 <strcmp+0x39>
    1185:	0f b6 cb             	movzbl %bl,%ecx
    1188:	eb ef                	jmp    1179 <strcmp+0x39>
    118a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001190 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    1196:	80 39 00             	cmpb   $0x0,(%ecx)
    1199:	74 12                	je     11ad <strlen+0x1d>
    119b:	31 d2                	xor    %edx,%edx
    119d:	8d 76 00             	lea    0x0(%esi),%esi
    11a0:	83 c2 01             	add    $0x1,%edx
    11a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    11a7:	89 d0                	mov    %edx,%eax
    11a9:	75 f5                	jne    11a0 <strlen+0x10>
    ;
  return n;
}
    11ab:	5d                   	pop    %ebp
    11ac:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    11ad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    11af:	5d                   	pop    %ebp
    11b0:	c3                   	ret    
    11b1:	eb 0d                	jmp    11c0 <memset>
    11b3:	90                   	nop
    11b4:	90                   	nop
    11b5:	90                   	nop
    11b6:	90                   	nop
    11b7:	90                   	nop
    11b8:	90                   	nop
    11b9:	90                   	nop
    11ba:	90                   	nop
    11bb:	90                   	nop
    11bc:	90                   	nop
    11bd:	90                   	nop
    11be:	90                   	nop
    11bf:	90                   	nop

000011c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	8b 55 08             	mov    0x8(%ebp),%edx
    11c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    11cd:	89 d7                	mov    %edx,%edi
    11cf:	fc                   	cld    
    11d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11d2:	89 d0                	mov    %edx,%eax
    11d4:	5f                   	pop    %edi
    11d5:	5d                   	pop    %ebp
    11d6:	c3                   	ret    
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <strchr>:

char*
strchr(const char *s, char c)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	8b 45 08             	mov    0x8(%ebp),%eax
    11e6:	53                   	push   %ebx
    11e7:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
    11ea:	0f b6 18             	movzbl (%eax),%ebx
    11ed:	84 db                	test   %bl,%bl
    11ef:	74 1d                	je     120e <strchr+0x2e>
    if(*s == c)
    11f1:	38 d3                	cmp    %dl,%bl
    11f3:	89 d1                	mov    %edx,%ecx
    11f5:	75 0d                	jne    1204 <strchr+0x24>
    11f7:	eb 17                	jmp    1210 <strchr+0x30>
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1200:	38 ca                	cmp    %cl,%dl
    1202:	74 0c                	je     1210 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    1204:	83 c0 01             	add    $0x1,%eax
    1207:	0f b6 10             	movzbl (%eax),%edx
    120a:	84 d2                	test   %dl,%dl
    120c:	75 f2                	jne    1200 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    120e:	31 c0                	xor    %eax,%eax
}
    1210:	5b                   	pop    %ebx
    1211:	5d                   	pop    %ebp
    1212:	c3                   	ret    
    1213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001220 <gets>:

char*
gets(char *buf, int max)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	57                   	push   %edi
    1224:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1225:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
    1227:	53                   	push   %ebx
    1228:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    122b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    122e:	eb 31                	jmp    1261 <gets+0x41>
    cc = read(0, &c, 1);
    1230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1237:	00 
    1238:	89 7c 24 04          	mov    %edi,0x4(%esp)
    123c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1243:	e8 02 01 00 00       	call   134a <read>
    if(cc < 1)
    1248:	85 c0                	test   %eax,%eax
    124a:	7e 1d                	jle    1269 <gets+0x49>
      break;
    buf[i++] = c;
    124c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1250:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    1252:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
    1255:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    1257:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    125b:	74 0c                	je     1269 <gets+0x49>
    125d:	3c 0a                	cmp    $0xa,%al
    125f:	74 08                	je     1269 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1261:	8d 5e 01             	lea    0x1(%esi),%ebx
    1264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1267:	7c c7                	jl     1230 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    1269:	8b 45 08             	mov    0x8(%ebp),%eax
    126c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    1270:	83 c4 2c             	add    $0x2c,%esp
    1273:	5b                   	pop    %ebx
    1274:	5e                   	pop    %esi
    1275:	5f                   	pop    %edi
    1276:	5d                   	pop    %ebp
    1277:	c3                   	ret    
    1278:	90                   	nop
    1279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001280 <stat>:

int
stat(char *n, struct stat *st)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	56                   	push   %esi
    1284:	53                   	push   %ebx
    1285:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1288:	8b 45 08             	mov    0x8(%ebp),%eax
    128b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1292:	00 
    1293:	89 04 24             	mov    %eax,(%esp)
    1296:	e8 d7 00 00 00       	call   1372 <open>
  if(fd < 0)
    129b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    129d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    129f:	78 27                	js     12c8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    12a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    12a4:	89 1c 24             	mov    %ebx,(%esp)
    12a7:	89 44 24 04          	mov    %eax,0x4(%esp)
    12ab:	e8 da 00 00 00       	call   138a <fstat>
  close(fd);
    12b0:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
    12b3:	89 c6                	mov    %eax,%esi
  close(fd);
    12b5:	e8 a0 00 00 00       	call   135a <close>
  return r;
    12ba:	89 f0                	mov    %esi,%eax
}
    12bc:	83 c4 10             	add    $0x10,%esp
    12bf:	5b                   	pop    %ebx
    12c0:	5e                   	pop    %esi
    12c1:	5d                   	pop    %ebp
    12c2:	c3                   	ret    
    12c3:	90                   	nop
    12c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    12c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    12cd:	eb ed                	jmp    12bc <stat+0x3c>
    12cf:	90                   	nop

000012d0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    12d6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12d7:	0f be 11             	movsbl (%ecx),%edx
    12da:	8d 42 d0             	lea    -0x30(%edx),%eax
    12dd:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
    12df:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    12e4:	77 17                	ja     12fd <atoi+0x2d>
    12e6:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
    12e8:	83 c1 01             	add    $0x1,%ecx
    12eb:	8d 04 80             	lea    (%eax,%eax,4),%eax
    12ee:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12f2:	0f be 11             	movsbl (%ecx),%edx
    12f5:	8d 5a d0             	lea    -0x30(%edx),%ebx
    12f8:	80 fb 09             	cmp    $0x9,%bl
    12fb:	76 eb                	jbe    12e8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
    12fd:	5b                   	pop    %ebx
    12fe:	5d                   	pop    %ebp
    12ff:	c3                   	ret    

00001300 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1300:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1301:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    1303:	89 e5                	mov    %esp,%ebp
    1305:	56                   	push   %esi
    1306:	8b 45 08             	mov    0x8(%ebp),%eax
    1309:	53                   	push   %ebx
    130a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    130d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1310:	85 db                	test   %ebx,%ebx
    1312:	7e 12                	jle    1326 <memmove+0x26>
    1314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    1318:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    131c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    131f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1322:	39 da                	cmp    %ebx,%edx
    1324:	75 f2                	jne    1318 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    1326:	5b                   	pop    %ebx
    1327:	5e                   	pop    %esi
    1328:	5d                   	pop    %ebp
    1329:	c3                   	ret    

0000132a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    132a:	b8 01 00 00 00       	mov    $0x1,%eax
    132f:	cd 40                	int    $0x40
    1331:	c3                   	ret    

00001332 <exit>:
SYSCALL(exit)
    1332:	b8 02 00 00 00       	mov    $0x2,%eax
    1337:	cd 40                	int    $0x40
    1339:	c3                   	ret    

0000133a <wait>:
SYSCALL(wait)
    133a:	b8 03 00 00 00       	mov    $0x3,%eax
    133f:	cd 40                	int    $0x40
    1341:	c3                   	ret    

00001342 <pipe>:
SYSCALL(pipe)
    1342:	b8 04 00 00 00       	mov    $0x4,%eax
    1347:	cd 40                	int    $0x40
    1349:	c3                   	ret    

0000134a <read>:
SYSCALL(read)
    134a:	b8 05 00 00 00       	mov    $0x5,%eax
    134f:	cd 40                	int    $0x40
    1351:	c3                   	ret    

00001352 <write>:
SYSCALL(write)
    1352:	b8 10 00 00 00       	mov    $0x10,%eax
    1357:	cd 40                	int    $0x40
    1359:	c3                   	ret    

0000135a <close>:
SYSCALL(close)
    135a:	b8 15 00 00 00       	mov    $0x15,%eax
    135f:	cd 40                	int    $0x40
    1361:	c3                   	ret    

00001362 <kill>:
SYSCALL(kill)
    1362:	b8 06 00 00 00       	mov    $0x6,%eax
    1367:	cd 40                	int    $0x40
    1369:	c3                   	ret    

0000136a <exec>:
SYSCALL(exec)
    136a:	b8 07 00 00 00       	mov    $0x7,%eax
    136f:	cd 40                	int    $0x40
    1371:	c3                   	ret    

00001372 <open>:
SYSCALL(open)
    1372:	b8 0f 00 00 00       	mov    $0xf,%eax
    1377:	cd 40                	int    $0x40
    1379:	c3                   	ret    

0000137a <mknod>:
SYSCALL(mknod)
    137a:	b8 11 00 00 00       	mov    $0x11,%eax
    137f:	cd 40                	int    $0x40
    1381:	c3                   	ret    

00001382 <unlink>:
SYSCALL(unlink)
    1382:	b8 12 00 00 00       	mov    $0x12,%eax
    1387:	cd 40                	int    $0x40
    1389:	c3                   	ret    

0000138a <fstat>:
SYSCALL(fstat)
    138a:	b8 08 00 00 00       	mov    $0x8,%eax
    138f:	cd 40                	int    $0x40
    1391:	c3                   	ret    

00001392 <link>:
SYSCALL(link)
    1392:	b8 13 00 00 00       	mov    $0x13,%eax
    1397:	cd 40                	int    $0x40
    1399:	c3                   	ret    

0000139a <mkdir>:
SYSCALL(mkdir)
    139a:	b8 14 00 00 00       	mov    $0x14,%eax
    139f:	cd 40                	int    $0x40
    13a1:	c3                   	ret    

000013a2 <chdir>:
SYSCALL(chdir)
    13a2:	b8 09 00 00 00       	mov    $0x9,%eax
    13a7:	cd 40                	int    $0x40
    13a9:	c3                   	ret    

000013aa <dup>:
SYSCALL(dup)
    13aa:	b8 0a 00 00 00       	mov    $0xa,%eax
    13af:	cd 40                	int    $0x40
    13b1:	c3                   	ret    

000013b2 <getpid>:
SYSCALL(getpid)
    13b2:	b8 0b 00 00 00       	mov    $0xb,%eax
    13b7:	cd 40                	int    $0x40
    13b9:	c3                   	ret    

000013ba <getcount>:

# Here
SYSCALL(getcount)
    13ba:	b8 16 00 00 00       	mov    $0x16,%eax
    13bf:	cd 40                	int    $0x40
    13c1:	c3                   	ret    

000013c2 <getpinfo>:
# Here 2
SYSCALL(getpinfo)
    13c2:	b8 17 00 00 00       	mov    $0x17,%eax
    13c7:	cd 40                	int    $0x40
    13c9:	c3                   	ret    

000013ca <uppriority>:
# Here 3
SYSCALL(uppriority)
    13ca:	b8 18 00 00 00       	mov    $0x18,%eax
    13cf:	cd 40                	int    $0x40
    13d1:	c3                   	ret    

000013d2 <dereference>:
# Here 4
SYSCALL(dereference)
    13d2:	b8 19 00 00 00       	mov    $0x19,%eax
    13d7:	cd 40                	int    $0x40
    13d9:	c3                   	ret    

000013da <sbrk>:

SYSCALL(sbrk)
    13da:	b8 0c 00 00 00       	mov    $0xc,%eax
    13df:	cd 40                	int    $0x40
    13e1:	c3                   	ret    

000013e2 <sleep>:
SYSCALL(sleep)
    13e2:	b8 0d 00 00 00       	mov    $0xd,%eax
    13e7:	cd 40                	int    $0x40
    13e9:	c3                   	ret    

000013ea <uptime>:
SYSCALL(uptime)
    13ea:	b8 0e 00 00 00       	mov    $0xe,%eax
    13ef:	cd 40                	int    $0x40
    13f1:	c3                   	ret    
    13f2:	66 90                	xchg   %ax,%ax
    13f4:	66 90                	xchg   %ax,%ax
    13f6:	66 90                	xchg   %ax,%ax
    13f8:	66 90                	xchg   %ax,%ax
    13fa:	66 90                	xchg   %ax,%ax
    13fc:	66 90                	xchg   %ax,%ax
    13fe:	66 90                	xchg   %ax,%ax

00001400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	57                   	push   %edi
    1404:	56                   	push   %esi
    1405:	89 c6                	mov    %eax,%esi
    1407:	53                   	push   %ebx
    1408:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    140b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    140e:	85 db                	test   %ebx,%ebx
    1410:	74 09                	je     141b <printint+0x1b>
    1412:	89 d0                	mov    %edx,%eax
    1414:	c1 e8 1f             	shr    $0x1f,%eax
    1417:	84 c0                	test   %al,%al
    1419:	75 75                	jne    1490 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    141b:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    141d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1424:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
    1427:	31 ff                	xor    %edi,%edi
    1429:	89 ce                	mov    %ecx,%esi
    142b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    142e:	eb 02                	jmp    1432 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    1430:	89 cf                	mov    %ecx,%edi
    1432:	31 d2                	xor    %edx,%edx
    1434:	f7 f6                	div    %esi
    1436:	8d 4f 01             	lea    0x1(%edi),%ecx
    1439:	0f b6 92 5d 18 00 00 	movzbl 0x185d(%edx),%edx
  }while((x /= base) != 0);
    1440:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    1442:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1445:	75 e9                	jne    1430 <printint+0x30>
  if(neg)
    1447:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    144a:	89 c8                	mov    %ecx,%eax
    144c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
    144f:	85 d2                	test   %edx,%edx
    1451:	74 08                	je     145b <printint+0x5b>
    buf[i++] = '-';
    1453:	8d 4f 02             	lea    0x2(%edi),%ecx
    1456:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    145b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    145e:	66 90                	xchg   %ax,%ax
    1460:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1465:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1468:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    146f:	00 
    1470:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1474:	89 34 24             	mov    %esi,(%esp)
    1477:	88 45 d7             	mov    %al,-0x29(%ebp)
    147a:	e8 d3 fe ff ff       	call   1352 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    147f:	83 ff ff             	cmp    $0xffffffff,%edi
    1482:	75 dc                	jne    1460 <printint+0x60>
    putc(fd, buf[i]);
}
    1484:	83 c4 4c             	add    $0x4c,%esp
    1487:	5b                   	pop    %ebx
    1488:	5e                   	pop    %esi
    1489:	5f                   	pop    %edi
    148a:	5d                   	pop    %ebp
    148b:	c3                   	ret    
    148c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1490:	89 d0                	mov    %edx,%eax
    1492:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    1494:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    149b:	eb 87                	jmp    1424 <printint+0x24>
    149d:	8d 76 00             	lea    0x0(%esi),%esi

000014a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14a0:	55                   	push   %ebp
    14a1:	89 e5                	mov    %esp,%ebp
    14a3:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    14a4:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14a6:	56                   	push   %esi
    14a7:	53                   	push   %ebx
    14a8:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14ab:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    14ae:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14b1:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    14b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    14b7:	0f b6 13             	movzbl (%ebx),%edx
    14ba:	83 c3 01             	add    $0x1,%ebx
    14bd:	84 d2                	test   %dl,%dl
    14bf:	75 39                	jne    14fa <printf+0x5a>
    14c1:	e9 c2 00 00 00       	jmp    1588 <printf+0xe8>
    14c6:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    14c8:	83 fa 25             	cmp    $0x25,%edx
    14cb:	0f 84 bf 00 00 00    	je     1590 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14d1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    14d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    14db:	00 
    14dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    14e0:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    14e3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14e6:	e8 67 fe ff ff       	call   1352 <write>
    14eb:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14ee:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    14f2:	84 d2                	test   %dl,%dl
    14f4:	0f 84 8e 00 00 00    	je     1588 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
    14fa:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    14fc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    14ff:	74 c7                	je     14c8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1501:	83 ff 25             	cmp    $0x25,%edi
    1504:	75 e5                	jne    14eb <printf+0x4b>
      if(c == 'd'){
    1506:	83 fa 64             	cmp    $0x64,%edx
    1509:	0f 84 31 01 00 00    	je     1640 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    150f:	25 f7 00 00 00       	and    $0xf7,%eax
    1514:	83 f8 70             	cmp    $0x70,%eax
    1517:	0f 84 83 00 00 00    	je     15a0 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    151d:	83 fa 73             	cmp    $0x73,%edx
    1520:	0f 84 a2 00 00 00    	je     15c8 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1526:	83 fa 63             	cmp    $0x63,%edx
    1529:	0f 84 35 01 00 00    	je     1664 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    152f:	83 fa 25             	cmp    $0x25,%edx
    1532:	0f 84 e0 00 00 00    	je     1618 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1538:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    153b:	83 c3 01             	add    $0x1,%ebx
    153e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1545:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1546:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1548:	89 44 24 04          	mov    %eax,0x4(%esp)
    154c:	89 34 24             	mov    %esi,(%esp)
    154f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1552:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1556:	e8 f7 fd ff ff       	call   1352 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    155b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    155e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1561:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1568:	00 
    1569:	89 44 24 04          	mov    %eax,0x4(%esp)
    156d:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    1570:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1573:	e8 da fd ff ff       	call   1352 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1578:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    157c:	84 d2                	test   %dl,%dl
    157e:	0f 85 76 ff ff ff    	jne    14fa <printf+0x5a>
    1584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1588:	83 c4 3c             	add    $0x3c,%esp
    158b:	5b                   	pop    %ebx
    158c:	5e                   	pop    %esi
    158d:	5f                   	pop    %edi
    158e:	5d                   	pop    %ebp
    158f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1590:	bf 25 00 00 00       	mov    $0x25,%edi
    1595:	e9 51 ff ff ff       	jmp    14eb <printf+0x4b>
    159a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    15a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    15a3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    15a8:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    15aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15b1:	8b 10                	mov    (%eax),%edx
    15b3:	89 f0                	mov    %esi,%eax
    15b5:	e8 46 fe ff ff       	call   1400 <printint>
        ap++;
    15ba:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    15be:	e9 28 ff ff ff       	jmp    14eb <printf+0x4b>
    15c3:	90                   	nop
    15c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    15c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    15cb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    15cf:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
    15d1:	b8 56 18 00 00       	mov    $0x1856,%eax
    15d6:	85 ff                	test   %edi,%edi
    15d8:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    15db:	0f b6 07             	movzbl (%edi),%eax
    15de:	84 c0                	test   %al,%al
    15e0:	74 2a                	je     160c <printf+0x16c>
    15e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    15e8:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15eb:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    15ee:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    15f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    15f8:	00 
    15f9:	89 44 24 04          	mov    %eax,0x4(%esp)
    15fd:	89 34 24             	mov    %esi,(%esp)
    1600:	e8 4d fd ff ff       	call   1352 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1605:	0f b6 07             	movzbl (%edi),%eax
    1608:	84 c0                	test   %al,%al
    160a:	75 dc                	jne    15e8 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    160c:	31 ff                	xor    %edi,%edi
    160e:	e9 d8 fe ff ff       	jmp    14eb <printf+0x4b>
    1613:	90                   	nop
    1614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1618:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    161b:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    161d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1624:	00 
    1625:	89 44 24 04          	mov    %eax,0x4(%esp)
    1629:	89 34 24             	mov    %esi,(%esp)
    162c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    1630:	e8 1d fd ff ff       	call   1352 <write>
    1635:	e9 b1 fe ff ff       	jmp    14eb <printf+0x4b>
    163a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1640:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1643:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1648:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    164b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1652:	8b 10                	mov    (%eax),%edx
    1654:	89 f0                	mov    %esi,%eax
    1656:	e8 a5 fd ff ff       	call   1400 <printint>
        ap++;
    165b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    165f:	e9 87 fe ff ff       	jmp    14eb <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1664:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1667:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1669:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    166b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1672:	00 
    1673:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1676:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1679:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    167c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1680:	e8 cd fc ff ff       	call   1352 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
    1685:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1689:	e9 5d fe ff ff       	jmp    14eb <printf+0x4b>
    168e:	66 90                	xchg   %ax,%ax

00001690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1691:	a1 dc 1a 00 00       	mov    0x1adc,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1696:	89 e5                	mov    %esp,%ebp
    1698:	57                   	push   %edi
    1699:	56                   	push   %esi
    169a:	53                   	push   %ebx
    169b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    169e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16a0:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a3:	39 d0                	cmp    %edx,%eax
    16a5:	72 11                	jb     16b8 <free+0x28>
    16a7:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16a8:	39 c8                	cmp    %ecx,%eax
    16aa:	72 04                	jb     16b0 <free+0x20>
    16ac:	39 ca                	cmp    %ecx,%edx
    16ae:	72 10                	jb     16c0 <free+0x30>
    16b0:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b2:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16b4:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16b6:	73 f0                	jae    16a8 <free+0x18>
    16b8:	39 ca                	cmp    %ecx,%edx
    16ba:	72 04                	jb     16c0 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16bc:	39 c8                	cmp    %ecx,%eax
    16be:	72 f0                	jb     16b0 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16c3:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    16c6:	39 cf                	cmp    %ecx,%edi
    16c8:	74 1e                	je     16e8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16ca:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16cd:	8b 48 04             	mov    0x4(%eax),%ecx
    16d0:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    16d3:	39 f2                	cmp    %esi,%edx
    16d5:	74 28                	je     16ff <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16d7:	89 10                	mov    %edx,(%eax)
  freep = p;
    16d9:	a3 dc 1a 00 00       	mov    %eax,0x1adc
}
    16de:	5b                   	pop    %ebx
    16df:	5e                   	pop    %esi
    16e0:	5f                   	pop    %edi
    16e1:	5d                   	pop    %ebp
    16e2:	c3                   	ret    
    16e3:	90                   	nop
    16e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    16e8:	03 71 04             	add    0x4(%ecx),%esi
    16eb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16ee:	8b 08                	mov    (%eax),%ecx
    16f0:	8b 09                	mov    (%ecx),%ecx
    16f2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    16f5:	8b 48 04             	mov    0x4(%eax),%ecx
    16f8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    16fb:	39 f2                	cmp    %esi,%edx
    16fd:	75 d8                	jne    16d7 <free+0x47>
    p->s.size += bp->s.size;
    16ff:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    1702:	a3 dc 1a 00 00       	mov    %eax,0x1adc
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1707:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    170a:	8b 53 f8             	mov    -0x8(%ebx),%edx
    170d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    170f:	5b                   	pop    %ebx
    1710:	5e                   	pop    %esi
    1711:	5f                   	pop    %edi
    1712:	5d                   	pop    %ebp
    1713:	c3                   	ret    
    1714:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    171a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1720:	55                   	push   %ebp
    1721:	89 e5                	mov    %esp,%ebp
    1723:	57                   	push   %edi
    1724:	56                   	push   %esi
    1725:	53                   	push   %ebx
    1726:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    172c:	8b 1d dc 1a 00 00    	mov    0x1adc,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1732:	8d 48 07             	lea    0x7(%eax),%ecx
    1735:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    1738:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    173a:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    173d:	0f 84 9b 00 00 00    	je     17de <malloc+0xbe>
    1743:	8b 13                	mov    (%ebx),%edx
    1745:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1748:	39 fe                	cmp    %edi,%esi
    174a:	76 64                	jbe    17b0 <malloc+0x90>
    174c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1753:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1758:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    175b:	eb 0e                	jmp    176b <malloc+0x4b>
    175d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1760:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1762:	8b 78 04             	mov    0x4(%eax),%edi
    1765:	39 fe                	cmp    %edi,%esi
    1767:	76 4f                	jbe    17b8 <malloc+0x98>
    1769:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    176b:	3b 15 dc 1a 00 00    	cmp    0x1adc,%edx
    1771:	75 ed                	jne    1760 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1776:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    177c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1781:	0f 43 fe             	cmovae %esi,%edi
    1784:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    1787:	89 04 24             	mov    %eax,(%esp)
    178a:	e8 4b fc ff ff       	call   13da <sbrk>
  if(p == (char*)-1)
    178f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1792:	74 18                	je     17ac <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1794:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1797:	83 c0 08             	add    $0x8,%eax
    179a:	89 04 24             	mov    %eax,(%esp)
    179d:	e8 ee fe ff ff       	call   1690 <free>
  return freep;
    17a2:	8b 15 dc 1a 00 00    	mov    0x1adc,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    17a8:	85 d2                	test   %edx,%edx
    17aa:	75 b4                	jne    1760 <malloc+0x40>
        return 0;
    17ac:	31 c0                	xor    %eax,%eax
    17ae:	eb 20                	jmp    17d0 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    17b0:	89 d0                	mov    %edx,%eax
    17b2:	89 da                	mov    %ebx,%edx
    17b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    17b8:	39 fe                	cmp    %edi,%esi
    17ba:	74 1c                	je     17d8 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    17bc:	29 f7                	sub    %esi,%edi
    17be:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    17c1:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    17c4:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
    17c7:	89 15 dc 1a 00 00    	mov    %edx,0x1adc
      return (void*)(p + 1);
    17cd:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    17d0:	83 c4 1c             	add    $0x1c,%esp
    17d3:	5b                   	pop    %ebx
    17d4:	5e                   	pop    %esi
    17d5:	5f                   	pop    %edi
    17d6:	5d                   	pop    %ebp
    17d7:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    17d8:	8b 08                	mov    (%eax),%ecx
    17da:	89 0a                	mov    %ecx,(%edx)
    17dc:	eb e9                	jmp    17c7 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    17de:	c7 05 dc 1a 00 00 e0 	movl   $0x1ae0,0x1adc
    17e5:	1a 00 00 
    base.s.size = 0;
    17e8:	ba e0 1a 00 00       	mov    $0x1ae0,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    17ed:	c7 05 e0 1a 00 00 e0 	movl   $0x1ae0,0x1ae0
    17f4:	1a 00 00 
    base.s.size = 0;
    17f7:	c7 05 e4 1a 00 00 00 	movl   $0x0,0x1ae4
    17fe:	00 00 00 
    1801:	e9 46 ff ff ff       	jmp    174c <malloc+0x2c>
