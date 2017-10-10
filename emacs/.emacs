(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;window position/size setting
(set-frame-position (selected-frame) 0 0)
(set-frame-width (selected-frame) 800)
(set-frame-height (selected-frame) 100)

;;;;slime configure
(add-to-list 'load-path "/opt/slime-2.19/")
(require 'slime)
(slime-setup '(slime-fancy slime-banner))

;;;;color theme 
(add-to-list 'load-path "/root/.emacs.d/color-theme/")
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-charcoal-black)
(color-theme-calm-forest)

;;;; speedbar 
(add-to-list 'load-path "/root/.emacs.d/speedbar/")
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(setq sr-speedbar-width 30)
(setq sr-speedbar-right-side nil)
(global-set-key (kbd "<f5>") (lambda()  
                               (interactive)  
                               (sr-speedbar-toggle)))

;;;;show line number
(global-linum-mode t)

(set-language-environment 'UTF-8) 
(set-locale-environment "UTF-8") 

(set-default-font "Courier 12") 
(set-fontset-font "fontset-default" 'unicode '("Kaiti SC" . "unicode-ttf"))

(setq auto-image-file-mode t);;let emacs open and show the image file

;;;;date time set ...
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(show-paren-mode t);;显示括号匹配
(setq show-paren-style 'parenthesis);;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处
(mouse-avoidance-mode 'animate);;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线

(setq-default make-backup-files nil);不要生成临时文件  
;;(setq backup-directory-alist '(("." . "~/.autosave")))  
;;设置自动备份文件保存的目录,以免把你的磁盘弄得乱七八糟(你可以  
;;去掉这一行试试看:P ~/.autosave 表示 主目录下的一个叫.autosave 的子目录，  
;;按照前面的方法设置主目录。 


;;语法高亮
(global-font-lock-mode t)


;;;;按回车键后下一行代码自动缩进
(add-hook 'lisp-mode-hook '(lambda ()
			     (local-set-key (kbd "RET") 'newline-and-indent)))

;;;;把缺省的 major mode 设置为 text-mode
(setq default-major-mode 'text-mode)

;;;;设置 sentence-end 可以识别中文标点
(setq sentence-end
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")

;;;;;设置emacs启动窗口大小
;(setq default-frame-alist 
;      '((height . 50) (width . 150))) 


;;;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿
;;;;3行时就开始滚动，可以很好的看到上下文
(setq scroll-margin 3
       scroll-conservatively 10000)

;;;;不显示GNU emacs启动界面
(setq inhibit-startup-message t)

;;;;emacs多窗口焦点切换默认快捷键启动 (shift)
(windmove-default-keybindings)

;;;;markdown 插件配置
(add-to-list 'load-path "/root/.emacs.d/markdown-mode/")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

