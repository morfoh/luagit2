-- Copyright (c) 2011 by Robert G. Jakabosky <bobby@sharedrealm.com>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

object "OdbObject" {
	c_source [[
typedef git_odb_object OdbObject;
]],
	destructor "free" {
		c_method_call "void" "git_odb_object_free" {},
	},
	method "id" {
		c_method_call { "OID", "*id" } "git_odb_object_id" {},
	},
	method "data" {
		c_method_call { "const char *", "data" } "git_odb_object_data" {},
		c_method_call { "size_t", "#data" } "git_odb_object_size" {},
	},
	method "size" {
		c_method_call "size_t" "git_odb_object_size" {},
	},
	method "type" {
		c_method_call { "git_otype", "(otype)" } "git_odb_object_type" {},
		c_call { "const char *", "type" } "git_object_type2string" { "git_otype", "otype" },
	},
}

