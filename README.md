###cl-base64url:  A Common Lisp library encode/decode base64url strings.

See [https://brockallen.com/2014/10/17/base64url-encoding/](https://brockallen.com/2014/10/17/base64url-encoding/)
for the rational behind base64url encoding.  Note that some Amazon Cognito serivces provide data in base64url format.

The nickname **base64url** can be used for the **cl-base64url** package.

[Function]<br>
**encode-base64url-string** (string)

		Encode a base64url string
		
		Example:
			(base64url:encode-base64url-string "Hello, World!")
		=> "SGVsbG8sIFdvcmxkIQ"
		

[Function]<br>
**decode-base64url-string** (string)

		Decode a base64url string
		
		Example:
			(base64url:decode-base64url-string "SGVsbG8sIFdvcmxkIQ")
		=> "Hello, World!"

#### Repository
[https://github.com/stablecross/cl-base64url](https://github.com/stablecross/cl-base64url)

####License
**cl-base64url** is available under a BSD-like license.  See the file LICENSE for
details.

#### Contact
For any questions or comments, please feel free to email me, Bob Felts
<wrf3@stablecross.com>
