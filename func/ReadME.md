
* Sockets

Sockets are another Inter Process Communication method.

Each process/application creates a Socket
The application that works as the server,
binds its socket to a known address
This allows the applications that work as
clients to locate the server

A socket has;
	a method of identifying 
	a range of communication (UNIX/IPv4/IPv6)

There is at least 2 types of sockets in most implementations;

1. Stream Sockets - SOCK_STREAM - TCP Sockets

- Operates as a connected pair of sockets
- Transmitted data is received intact or receives a failure notification (Reliable)
- Data transmitted both directions (Bidirectional)
- No message boundaries (Messages are a byte-stream)

2. Datagram Sockets - SOCK_DGRAM - UDP Sockets

- Connectionless sockets - Do not need to be connected to another socket to be used
- Data is exchanged in form of datagrams - Message boundaries exists
- Data transmission is not reliable - Messages in order/ out of order / duplicated / not arrive at all

* Functions

** socket()

creates a new socket

#include <sys/socket.h>

int		socket(int domain, int type, int protocol)

Returns:
	Success : fd
	Failure : -1

domain	: communication domain for the socket
type 	: socket type (SOCK_STREAM, SOCK_DGRAM)
protocol: usually 0. 

** bind()

bonds a socket to an address

#include <sys/socket.h>

int 	bind(
				int sockfd,
				const struct sockaddr *addr,
				socklen_t addrlen
				)

Returns:
	Success : 0
	Failure : -1

sockfd 	: fd obtained from socket()
addr 	: pointer to a struct with address to which socket is to be bound
addrlen : size of addr struct

addr struct depends on socket domain(https://sites.ualberta.ca/dept/chemeng/AIX-43/share/man/info/C/a_doc_lib/aixprggd/progcomc/skt_comms.htm)
socklen_t is integer type defined in SUSv3

struct sockaddr
{
	sa_family_t sa_family;   // address family - integer datatype
	char 		sa_data[14]; // socket address - sa_family determines the size of array
};

** gai_strerror

On error getaddrinfo() returns non-zero error code
	EAI_ADDRFAMILY
	EAI_AGAIN
	EAI_BADFLAGS
	EAI_FAIL
	EAI_FAMILY
	EAI_MEMORY
	EAI_NONAME
	EAI_OVERFLOW
	EAI_SERVICE
	EAI_SOCKETYPE
	EAI_SYSTEM
given one of these error codes;
gai_strerror() returns a string describing error code.

#include <netdb.h>

const char *gai_strerror(int errcode);

** getaddrinfo

For a given host name and service name
and hints?, getaddrinfo()
returns a list of socket address sructures,
each containing an IP address and port number

#include <sys/socket.h>
#include <netdb.h>

int getaddrinfo(const char *host, const char *service,
	const struct addrinfo *hints,
	struct addrinfo **result);
