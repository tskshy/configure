#!/usr/bin/env wish

# 需要安装tcl/tk以及jq命令

set MAXX 512
set MAXY 384
wm protocol . WM_DELETE_WINDOW {exit}
wm title . "正在翻译，请稍后 ..."
wm minsize . 256 128
wm maxsize . $MAXX $MAXY

wm attributes . -alpha ".80"
wm positionfrom . program

proc translate {q} {
	set json [exec curl -XGET --get --silent --data-urlencode "keyfrom=tskshy-translate" --data-urlencode "key=802818759" --data-urlencode "type=data" --data-urlencode "doctype=json" --data-urlencode "version=1.1" --data-urlencode "q=$q" "http://fanyi.youdao.com/openapi.do"]

	puts $json
	set code [exec echo $json | jq ".errorCode"]

	if {$code == 0} {
		return [list \
				[list "单词" [exec echo $json | jq -c -r ".query"]]\
				[list "音标" [exec echo $json | jq -c -r ".basic.phonetic"]]\
				[list "翻译" [exec echo $json | jq -c -r ".translation"]]\
				[list "解释" [exec echo $json | jq -c -r ".basic.explains"]]\
		]
	} elseif {$code == 20} {
		return [list [list "错误:$code" "要翻译的文本过长"]]
	} elseif {$code == 30} {
		return [list [list "错误:$code" "无法进行有效的翻译"]]
	} elseif {$code == 40} {
		return [list [list "错误:$code" "不支持的语言类型"]]
	} elseif {$code == 50} {
		return [list [list "错误:$code" "无效的key"]]
	} elseif {$code == 60} {
		return [list [list "错误:$code" "无词典结果，仅在获取词典结果生效"]]
	} else {
		return [list [list "错误:$code" "未知错误"]]
	}
}

#set msg "正在翻译，请稍后 ..."
#label .msg -text $msg -background white
#pack .msg -fill both -expand 1
#destroy .msg

set result [translate [exec xclip -o]]
wm title . "网易翻译"

for {set i 0} {$i < [llength $result]} {incr i} {
	set inner_val [lindex $result $i]
	for {set j 0} {$j < [llength $inner_val]} {incr j} {
		grid [label .l-$i$j -text [lindex $inner_val $j] -background white -wraplength $MAXX] -row $i -column $j -padx 1 -pady 1 -ipadx 1 -ipady 1 -sticky news
		grid rowconfigure . $i -weight 1
		grid columnconfigure . $j -weight 1
	}
}

#grid rowconfigure . 0 -weight 1
#grid columnconfigure . 0 -weight 1

#set word "hello"
#set result "你好"
#
#message .word -text $word -background white
#pack .word -fill x


#message .wait -text "haaa" -background white
#pack .wait -fill x
#
#button .b -text "destroy message" -command {
#		wm title . "change"
#		destroy .wait
#}
#pack .b
#
#bind .wait <Button-1> {
#	puts "label key event %x %y"
#}




