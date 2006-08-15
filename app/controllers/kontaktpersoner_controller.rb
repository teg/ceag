class KontaktpersonerController < ApplicationController

  def index
    list
    render :action => 'list'
  end

  def list
    @people = [
      { :name => 'Ola Wiik', :position => 'administrerende direktør', :phone => [32244620,91633495], :mail => 'ow@ceag.no'},
      { :name => 'Per Ove Enga', :position => ['leder salgsstøtte', 'salg-/produktansvarlig ex'], :phone => [32244622,90822246], :mail => 'poe@ceag.no'},
      { :name => 'Kristin Skarholt', :position => 'økonomi-/IT-ansvarlig', :phone => 32244629, :mail => 'ks@ceag.no'},
      { :name => 'Trond Gundersen', :position => 'salgsingeniør', :phone => [32244628,90126772], :mail => 'tg@ceag.no'},
      { :name => 'John Hals', :position => 'salg-/produktansvarlig ex-lys og nødlys', :phone => [32244625,92256958], :mail => 'jh@ceag.no'},
      { :name => 'Jan Akselsen', :position => 'salg og ordremottak engeneering-tavler og ex', :phone => 32244626, :mail => 'ja@ceag.no'},
      { :name => 'Lise-Lotte Halvorsen', :position => 'salg og ordremottak ex', :phone => 32244624, :mail => 'llh@ceag.no'},
      { :name => 'Sverra Christer Lie', :position => ['avdelingsleder', 'salg og verkstedtjenester'], :phone => [51631135,91314363], :mail => 'scl@ceag.no'},
      { :name => 'Age Bergfinn Hauge', :position => 'ex montasje', :phone => 51631136},
      ]
  end
end
