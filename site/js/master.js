// Check if the "visited" cookie already exists
if (!document.cookie.includes("visited")) {
    alert("!! IM CURRENTLY REWORKING THE WHOLE WEBSITE !!\n\nIt might be broken or not working properly.\nIf you have any questions or need help, feel free to contact me.");
    // Get the current date and time
    const currentDate = new Date();

    // Calculate the expiration date (1 day from the current date)
    const expirationDate = new Date(currentDate.getTime() + 60 * 60 * 1000); // 24 * 60 * 60 * 1000

    // Set the "visited" cookie with the expiration date
    document.cookie = `visited=true; expires=${expirationDate.toUTCString()}; path=/`;
}