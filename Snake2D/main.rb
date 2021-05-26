require 'dxruby'

filename = Window.openFilename([["スクリプト(*.rb)", "*.rb"]], "実行するスクリプト選択")
load filename
