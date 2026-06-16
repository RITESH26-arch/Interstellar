


// ==========================
// SIGNUP
// ==========================
async function signupUser() {
  const email = document.getElementById("email").value.trim();
  const password = document.getElementById("password").value.trim();
  const confirmPassword = document.getElementById("confirmpassword").value.trim();
  const location = document.getElementById("location").value.trim();

  if (!email || !password || !confirmPassword || !location) {
    alert("Please fill all fields");
    return;
  }

  if (password !== confirmPassword) {
    alert("Passwords do not match ❌");
    return;
  }

  try {
    const response = await fetch("/signup", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        email: email,
        password: password,
        confirm_password: confirmPassword,
        location: location
      })
    });

    const data = await response.json();

    if (response.ok) {
      alert("Signup successful 🚀");
      window.location.href = "Home.html";
    } else {
      alert(data.message || "Signup failed");
    }

  } catch (error) {
    console.error(error);
    alert("Server error");
  }
}


// ==========================
// LOGIN
// ==========================
async function loginUser() {
  const email = document.getElementById("email").value.trim();
  const password = document.getElementById("password").value.trim();

  if (!email || !password) {
    alert("Please enter email and password");
    return;
  }

  try {
    const response = await fetch("/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email, password })
    });

    const data = await response.json();

    if (response.status === "success") {
      alert("Login successful 🚀");
      window.location.href = "Home.html";
    } else {
      alert(data.message || "Invalid credentials");
    }

  } catch (error) {
    console.error(error);
    alert("Server error");
  }
}


// ==========================
// EVENT BINDING (FIXED)
// ==========================
document.addEventListener("DOMContentLoaded", () => {

  const btn = document.getElementById("submitbtn");
  if (!btn) return;

  // Signup page
  if (document.getElementById("confirmpassword")) {
    btn.addEventListener("click", signupUser);
  } 
  // Login page
  else {
    btn.addEventListener("click", loginUser);
  }

});





