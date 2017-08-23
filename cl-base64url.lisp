;;; Copyright (c) 2017 William R. Felts III, All Rights Reserved
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;;
;;;   * Redistributions of source code must retain the above copyright
;;;     notice, this list of conditions and the following disclaimer.
;;;
;;;   * Redistributions in binary form must reproduce the above
;;;     copyright notice, this list of conditions and the following
;;;     disclaimer in the documentation and/or other materials
;;;     provided with the distribution.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;;;
;;;; cl-base64url.lisp
;;;;
;;;; BASE64URL encoding/decoding
;;;; cf. https://stackoverflow.com/questions/1228701/code-for-decoding-encoding-a-modified-base64-url
;;;;

(in-package #:cl-base64url)

;;; "cl-base64url" goes here. Hacks and glory await!

(defun pad-base64-string (s)
  (let ((residue (mod (length s) 4)))
    (cond
      ((equal residue 0) s)
      ((equal residue 2) (concatenate 'string s "=="))
      ((equal residue 3) (concatenate 'string s "="))
      (t (error "illegal base64url string")))))

;;;
;;; map '-' -> '+' and '_' -> '/' in string
;;; add pad characters
;;; convert base64 to string
;;;
(defun decode-base64url-string (string)
  (cl-base64:base64-string-to-string (pad-base64-string (sublis '((#\- . #\+) (#\_ . #\/)) string))))

;;;
;;;
(defun encode-base64url-string (string)
  (sublis '((#\+ . #\-) (#\/ . #\_)) (string-right-trim "=" (cl-base64:string-to-base64-string string))))
