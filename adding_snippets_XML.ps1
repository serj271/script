$newBooks = @(
    [PSCustomObject] @{
        "Title" = "Patriot Games";
        "Author" = "Tom Clancy";
        "PageCount" = 540;
        "Publishers" = @(
            [PSCustomObject] @{
                "ISBN" = "978-0-39-913241-4";
                "Year" = "1987";
                "First" = $True;
                "Name" = "Putnam";
                "Binding" = "Hardcover";
            }
        );
        "Characters" = @(
            "Jack Ryan", "Prince of Wales", "Princess of Wales",
            "Robby Jackson", "Cathy Ryan", "Sean Patrick Miller"
        );
        "film" = $True;
    },
    [PSCustomObject] @{
        "Title" = "The Hitchhiker's Guide to the Galaxy";
        "Author" = "Douglas Adams";
        "PageCount" = 216;
        "Publishers" = @(
            [PSCustomObject] @{
                "ISBN" = "978-0-33-025864-7";
                "Year" = "1979";
                "First" = $True;
                "Name" = "Pan Books";
                "Binding" = "Hardcover";
            }
        );
        "Characters" = @(
            "Arthur Dent", "Marvin", "Zaphod Beeblebrox", "Ford Prefect",
            "Trillian", "Slartibartfast", "Dirk Gently"
        );
        "film" = $True;
    }
);

$t_book = [xml] @'
    <book>
        <title />
        <author />
        <pageCount />
        <publishers />
        <characters />
        <film>False</film>
    </book>
'@;

$t_publisher = [xml] @'
    <publisher>
        <isbn/>
        <name/>
        <year/>
        <binding/>
        <first>false</first>
    </publisher>
'@;

$t_character = [xml] @'
    <character name="" />
'@;

<#Read the xml document#>
[xml]$xml = Get-Content .\books.xml;
# Let's show a list of titles to see what we've got currently:
$xml.books.book | Select Title, Author, @{N="ISBN";E={If ( $_.Publishers.Publisher.Count ) {
$_.Publishers.publisher[0].ISBN} Else { $_.Publishers.publisher.isbn}}};;
# Outputs:
# title author ISBN
# ----- ------ ----
# Of Mice And Men John Steinbeck 978-88-58702-15-4
# The Hunt for Red October Tom Clancy 978-08-70212-85-7

# Let's show our new books as well:
$newBooks | Select Title, Author, @{N="ISBN";E={$_.Publishers[0].ISBN}};
# Outputs:
# Title Author ISBN
# ----- ------ ----
# Patriot Games Tom Clancy 978-0-39-913241-4
# The Hitchhiker's Guide to the Galaxy Douglas Adams 978-0-33-025864-7

ForEach ( $book in $newBooks ){
    $root = $xml.SelectSingleNode("/books");
    # Add the template for a book as a new node to the root element
    [void]$root.AppendChild($xml.ImportNode($t_book.book, $true));
    # Select the new child element
    $newElement = $root.SelectSingleNode("book[last()]");
    # Update the parameters of that new element to match our current new book data
    $newElement.title = [String]$book.Title;
    $newElement.author = [String]$book.Author;
    $newElement.pageCount = [String]$book.PageCount;
    $newElement.film = [String]$book.Film;
    # Iterate through the properties that are Children of our new Element:
    ForEach ( $publisher in $book.Publishers ){
      <#  Create the new child publisher element
        Note the use of "SelectSingleNode" here, this allows the use of the "AppendChild" method as it returns
        a XmlElement type object instead of the $Null data that is currently stored in that leaf  of the
        XML document tree#>
        [void]$newElement.SelectSingleNode("publishers").AppendChild($xml.ImportNode($t_publisher.publisher
        , $true));
        # Update the attribute and text values of our new XML Element to match our new data
        $newPublisherElement = $newElement.SelectSingleNode("publishers/publisher[last()]");
        $newPublisherElement.year = [String]$publisher.Year;
        $newPublisherElement.name = [String]$publisher.Name;
        $newPublisherElement.binding = [String]$publisher.Binding;
        $newPublisherElement.isbn = [String]$publisher.ISBN;
        If ( $publisher.first ) {
            $newPublisherElement.first = "True";
        }
    }
    ForEach ( $character in $book.Characters ) {
    # Select the characters xml element
        $charactersElement = $newElement.SelectSingleNode("characters");
        # Add a new character child element
        [void]$charactersElement.AppendChild($xml.ImportNode($t_character.character, $true));
        # Select the new characters/character element
        $characterElement = $charactersElement.SelectSingleNode("character[last()]");
        # Update the attribute and text values to match our new data
        $characterElement.name = [String]$character;
    }

}
# Check out the new XML:
$xml.books.book | Select Title, Author, @{N="ISBN";E={If ( $_.Publishers.Publisher.Count ) {
$_.Publishers.publisher[0].ISBN} Else { $_.Publishers.publisher.isbn}}};
# Outputs:
# title author ISBN
# ----- ------ ----
# Of Mice And Men John Steinbeck 978-88-58702-15-4
# The Hunt for Red October Tom Clancy 978-08-70212-85-7
# Patriot Games Tom Clancy 978-0-39-913241-4
# The Hitchhiker's Guide to the Galaxy Douglas Adams 978-0-33-025864-7

$xml.Save("c:\script\works.xml");

