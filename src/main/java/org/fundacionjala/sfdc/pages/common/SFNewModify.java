package org.fundacionjala.sfdc.pages.common;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

import org.fundacionjala.core.ui.Base;

/**
 * SFNewModify.
 */
public abstract class SFNewModify extends Base {

    @FindAll({
            @FindBy(how = How.CSS, using = ".pbButton > input[name='save']"),
            @FindBy(how = How.CSS, using = "button.uiButton--brand.uiButton.forceActionButton")
    })
    protected WebElement saveNewAccountButton;

    /**
     * getSaveNewAccountButton.
     */
    public abstract void getSaveNewAccountButton();
}
