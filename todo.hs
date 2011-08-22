-- Todo list manager

import Data.List
import System.Directory
import System.Environment
import System.IO

-- View
enumerate = zipWith (\i l -> show i ++ " - " ++ l) [1..]

viewTodos filename _ = do
    content <- readFile filename
    let todos = lines content
    putStrLn $ "You have " ++ (show $ length todos) ++ " todo items:"
    mapM_ putStrLn $ enumerate todos

-- Add
ensureEOL text
    | "\n" `isSuffixOf` text = text
    | otherwise = text ++ "\n"

addTodo filename [text] = appendFile filename (ensureEOL text)

-- Remove
deleteIndex i lst
    | i < length lst = take i lst ++ drop (i+1) lst
    | otherwise = error "deleteIndex: index too large"

removeTodo filename [index] = do
    content <- readFile filename
    let indexNo = (read index) - 1
        todos = lines content
        todos' = deleteIndex indexNo todos
    (tmpFile, tmpHandle) <- openTempFile "." filename
    hPutStr tmpHandle (unlines todos')
    hClose tmpHandle
    renameFile tmpFile filename
    print indexNo


dispatch = [("view", viewTodos),
            ("add", addTodo),
            ("remove", removeTodo)
           ]

main = do
    args <- getArgs
    let (cmd:filename:xs) = args
        (Just action) = lookup cmd dispatch
    action filename xs

-- vi: set sts=4 sw=4 et :
