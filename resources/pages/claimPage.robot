*** Settings ***


*** Variable ***
${OrganizerPass}               //*[@name="organizerPassword"]
${CreateGroup}                 //button[@type="submit"]
${cardNumber}                  //input[@id="card_number"]
${cvv}                         //input[@id="cvv"]
${expDate}                     //input[@name="card.expDate"]
${fullname}                    //input[@name="card.fullName"]
${newMethod}                   //div[@btn btn-secondary add-new-button]
${UserMenu}                    //button[@class="btn btn-link nav-link dropdown-toggle"]
${logOut}                      //a[@href="/logout"]
${contributeBtn}               //button[@class="btn btn-primary btn-block"]
${cardNumber}                  //input[@id="card_number"]
${cvv}                         //input[@id="cvv"]
${expDate}                     //input[@name="card.expDate"]
${fullname}                    //input[@name="card.fullName"]
${CreateGroup}                 //button[@type="submit"]
${guest_email}                 //input[@name="auth.email""]
${guest_pass}                  //input[@name="auth.password"]

*** Keywords ***
Log out User     
    Click Element               xpath:${UserMenu} 
    Click Element               xpath:${logOut} 
    Sleep                       3 second

Click on contribute button
    Click Element               xpath:${contributeBtn} 
    Sleep                       2 second

Login as organizer toggle claim page
    [Arguments]                 ${PasswordOrg}
    Input Text                  xpath:${OrganizerPass}              

ClickCreateGroup(){
        wd.click(this.elements.CreateGroup)
    }
JoinWith(){
        wd.click(this.elements.CreateGroup);
    }
addNewPaymentMethod(Card:string, cvv:string, ExpDate:string, fullName:string){
        wd.click(this.elements.newMethod);
        wd.setValue(this.elements.cardNumber, Card);
        wd.setValue(this.elements.cvv, cvv);
        wd.setValue(this.elements.fullname, ExpDate);
        wd.setValue(this.elements.expDate, fullName);
        wd.click(this.elements.CreateGroup);
    }
ClickContribute(){
        wd.click(this.elements.contributeBtn)
    }

contributeGroupAsGuest(Card:string, cvv:string, ExpDate:string, fullName:string, email:string, pass:string){
        wd.setValue(this.elements.cardNumber, Card);
        wd.setValue(this.elements.cvv, cvv);
        wd.setValue(this.elements.fullname, ExpDate);
        wd.setValue(this.elements.expDate, fullName);
        wd.setValue(this.elements.guest_email, email);
        wd.setValue(this.elements.guest_pass, pass);
        wd.click(this.elements.CreateGroup);
    }

getUserName(){
        wd.getText(this.elements.UserMenu);
    }