set foldmethod=manual

function! FindRootPath()
python3 << end

def set_root_directory()::
    """ find .git repo """
    """ need to look backward from current directory  """

    path = "."
    oldDirectory = os.getcwd()
    
    need_to_search = True

    count = 0
    while (need_to_search):
        if os.path.normpath(os.getcwd()) == os.path.normpath(home) or\
            count == 5:
            os.chdir(oldDirectory)
            return home

        for r, d, f in os.walk(os.getcwd()):
            if '.git' in d:
                need_to_search = False
                
        if need_to_search:
            os.chdir("../.")
        
        count += 1

    newpath = os.getcwd()
    os.chdir(oldDirectory)
    print(type(newpath))
    command = "let g:root_path = '{}'".format(newpath)
    vim.command(command)

    return newpath

set_root_directory()
end
endfunction

function! FindUsages()
let currentword = expand("<cword>")
python3 << end
import os, vim
def find_usage_py():
    vim.command("call FindRootPath()")
    path = vim.eval("g:root_path")
    if (home == path):
        print("file not found")
        return

    for r, d, f in os.walk(path):
        for file in f:
            file_name, extension = os.path.splitext(file)
            if extension != '.py':
                continue

def get_needed_keyword():
    return
    
end
endfunction

function! FindFileUnderCursor()
let currentword = expand("<cword>")
python3 << end
import os, vim, getpass

username = getpass.getuser()
home = "/home/"+ username


def list_paths(search_for, path):
  files = []
  for r, d, f in os.walk(path):
      """module"""
      for file in f:
          """ remove extension """
          file_without_extension = os.path.splitext(file)[0]
          if file_without_extension == search_for:
              files.append(os.path.join(r, file))

  return files


def open_file(files):
  if len(files) > 1:
      """test"""
      try:
          vim.command("call inputsave()")
          vim.command("let num = input('enter file: ')")
          vim.command("call inputrestore()")
          try:
              range = int(vim.eval("num"))
          except:
              print("invalid number")
              return

          vim.command(":tabe " + files[range])
      except vim.error:
          print("command could no be executed")
            
  else:
      vim.command(":tabe " + files[0])
    
    
def find_file_path():
  files = []
  search_for = vim.eval("currentword")
  if len(search_for) == 0:
      print("nothing to do")
      return

  vim.command("call FindRootPath()")
  path = vim.eval("g:root_path")
  if (home == path):
      print("file not found")
      return

  files = list_paths(search_for, path)

  try:
      if len(files) == 0:
          print("file not found")
          return

  except vim.error:
      print("file could not be open in new tab module")
      return

  for i, f in enumerate(files):
      print("{}, {}".format(i, f))

  open_file(files)


find_file_path()
end
endfunction

function! PrintOutMessage()
let currentword = expand("<cword>")
python3 << end
class Message:
    def __init__(self):
        self.last_cursor_line_postion = 0
        self.files = {
            "cpp": self.print_cpp_out_message,
            "python" : self.print_python_out_message,
        }
        self.message_form = ""
        self.cursor_pos = None


    def print_cpp_out_message(self):
        self.message_form = ('std::cout << "" << ' + vim.eval('currentword') + ' << std::endl;')
        self.cursor_pos = self.message_form.find('"') + 1
        

    def print_python_out_message(self):
        self.message_form =  ("print('{}'.format(" + vim.eval('currentword') + "))")
        self.cursor_pos = self.message_form.find('{')


    def adjust_out_message(self):
        if len(self.message_form) == 0 or self.cursor_pos == None:
            print("form not supported") 
            return

        form_length = len(self.message_form) + self.last_cursor_line_postion[1]
        adjusted_message = self.message_form.rjust(form_length)

        vim.current.buffer.append(adjusted_message,
            self.last_cursor_line_postion[0])

        self.update_cursor(self.cursor_pos)


    def update_cursor(self, p):
        line = vim.current.window.cursor[0]
        row = vim.current.window.cursor[1]
        vim.current.window.cursor = (line + 1, row + p)


    def print_message(self):
        func = self.files.get(vim.eval("&ft"), (None, None))
        if func == (None, None):
            print("filetype not supported")
            return

        func()
        vim.command("normal ^")
        self.last_cursor_line_postion = vim.current.window.cursor
        self.adjust_out_message()


m = Message()
m.print_message()
end
endfunction

function! MoveUpAndDown(key) range
python3 << end
def move_file():
    p = vim.eval("a:firstline")
    d = vim.eval("a:lastline")
    k = vim.eval("a:key")
    move = 0
    if int(k) == -1:
        move = int(p) + int(k) - 1
    elif int(k) == 1:
        move = int(d) + int(k)

    vim.command("normal! =")
    vim.command(str(p) + "," + str(d) + "m "+ str(move))


move_file()
end
endfunction

function! DeleteMultipleLines(key) range
python3 << end
def delete_without_jump():
    first = int(vim.eval("a:firstline"))
    last = int(vim.eval("a:lastline"))
    k = int(vim.eval("a:key"))
    diff = last - first
    pos = 0
    if k == -1:
        pos = first - diff - 1
    else:
        pos = first + diff + 1

    current_cursor = vim.current.window.cursor
    vim.command("call inputsave()")
    vim.command("let num = input('num of lines: ')")
    vim.command("call inputrestore()")
    l = int(vim.eval("num")) + pos - 1
    vim.command(str(pos) + "," + str(l) + "d")
    vim.current.window.cursor = current_cursor


delete_without_jump()
end
endfunction

function! DeleteOneLine(key) range
python3 << end
def delete_without_jump():
    first = int(vim.eval("a:firstline"))
    last = int(vim.eval("a:lastline"))
    k = int(vim.eval("a:key"))
    diff = last - first
    pos = 0
    if k == -1:
        pos = first - diff - 1
    else:
        pos = first + diff + 1

    current_cursor = vim.current.window.cursor
    vim.command(str(pos) + "d")
    vim.current.window.cursor = current_cursor


delete_without_jump()
end
endfunction

function! DeleteFunction()
python3 << end
import vim
# cpp not supported yet
def delete_cpp_function():
    return


def find_pattern(eof, start_point, pattern, look_up):
    found = False

    line = vim.current.line
    if line.find("class") != -1 or \
        not line.strip() or \
        line.find("import") != -1:
        return -1

    while(not found):
        line = vim.current.buffer[start_point - 1]
        if not line.strip():
            break

        if look_up and start_point == 1:
            return start_point

        if not look_up and start_point == eof:
            return start_point

        if line.find("   ") == -1:
            return start_point

        if not line.strip():
            if look_up:
                start_point -= 1
            else:
                start_point += 1

            continue

        for pat in pattern:
            # if not found
            found = True

            if line.find(pat) == -1:
                if look_up:
                    start_point -= 1
                else:
                    start_point += 1

                found = False
                break

    return start_point 


def delete_python_function():
    current_line = vim.current.window.cursor
    found = False
    up = int(current_line[0])
    down = int(current_line[0])
    pattern = ["def ", "):"]
    eof = int(vim.eval("line('$')"))

    up = find_pattern(eof, up, pattern, True)
    down = find_pattern(eof, up + 1, pattern, False)

    return (up, down)


def delete_function():
    filetype = vim.eval("&ft")
    first = 0
    last = 0
    if filetype == 'cpp':
        first, last = delete_cpp_function()
    elif filetype == 'python':
        first, last = delete_python_function()
    else:
        print("file not supported")

    if first == -1 or last == -1:
        return

    vim.command(str(first) + "," + str(last) + "d")


delete_function()
end
endfunction

" not implemented yet
function! FindFunctionDefinition(key) range
python3 << end
def find_function_cpp_file():
    return

def find_function_python_file():
    return

end
endfunction

" TODO: comment multiple line at once
"       delete hole function, move or copy
