;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%DLEVAL2^INT^1^59547,73867^0
DLEVAL2 ;
 
 
 
 
MENU(MN) 
 K @(MN)
 S @MN="21^5^79"
 S @MN@(1)=$$^%QZCHW("Etude")_"^ETU",@MN@(1,"COM")=$$^%QZCHW("Modification des parametres de l'etude")
 S @MN@(2)=$$^%QZCHW("Activation")_"^DEL",@MN@(2,"COM")=$$^%QZCHW("Jalonnement et rejalonnement sur le ou les lancements definis sur l'etude")
 S @MN@(3)=$$^%QZCHW("Mise.au.Point")_"^MAP",@MN@(3,"COM")=$$^%QZCHW("Jalonnement et rejalonnement en mode manuel")
 S @MN@(4)=$$^%QZCHW("Resultats")_"^RESU",@MN@(4,"COM")=$$^%QZCHW("Visualisation des resultats de l'activation")
 S @MN@(5)=$$^%QZCHW("Machines")_"^MACH",@MN@(5,"COM")=$$^%QZCHW("Acces aux machines de l'etude")
 S @MN@(6)=$$^%QZCHW("Charges")_"^CHAR",@MN@(6,"COM")=$$^%QZCHW("Charges sur les machines de l'etude")
 S @MN@(7)=$$^%QZCHW("Flux")_"^FLU",@MN@(7,"COM")=$$^%QZCHW("Visualisation du flux")
 S @MN@(8)=$$^%QZCHW("Visu.nomenclature")_"^VISU",@MN@(8,"COM")=$$^%QZCHW("Visualisation de l'arbre de la nomenclature sur l'article jalonne")
 S @MN@(9)=$$^%QZCHW("IRD")_"^IRDM",@MN@(9,"COM")=$$^%QZCHW("Calcul de l'IRD")
 S @MN@(10)=$$^%QZCHW("MIX")_"^MIX",@MN@(10,"COM")=$$^%QZCHW("Visualisation du MIX")
 S @MN@(11)=$$^%QZCHW("Dejalonnement")_"^DEJAL",@MN@(11,"COM")=$$^%QZCHW("Retrait des charges affectees aux machines")
 S @MN@(12)=$$^%QZCHW("Dates.fixes")_"^DATFI",@MN@(12,"COM")=$$^%QZCHW("Affectation de dates fixes aux operations")
 Q
 
MENR(MN) 
 K @(MN)
 S @MN="21^15^79"
 S @MN@(1)=$$^%QZCHW("Compte.rendu")_"^CPT",@MN@(1,"COM")=$$^%QZCHW("Compte rendu de la derniere activation de cette etude")
 S @MN@(2)=$$^%QZCHW("Stockage")_"^RES",@MN@(2,"COM")=$$^%QZCHW("Resultat du carnet")
 S @MN@(3)=$$^%QZCHW("Etalement.stades")_"^STA",@MN@(3,"COM")=$$^%QZCHW("Visualisation des stades pour chaque jour")
 Q
 
MENM(MN) 
 K @(MN)
 S @MN="21^15^79"
 S @MN@(1)=$$^%QZCHW("Description.machine")_"^MAC",@MN@(1,"COM")=$$^%QZCHW("Acces direct aux machines")
 S @MN@(2)=$$^%QZCHW("Calendrier")_"^CAL",@MN@(2,"COM")=$$^%QZCHW("Acces au calendrier des machines")
 Q
 
MENC(MN) 
 K @(MN)
 S @MN="21^15^79"
 S @MN@(1)=$$^%QZCHW("Charge.totale")_"^CHT",@MN@(1,"COM")=$$^%QZCHW("Charge des machines de l'etude")
 S @MN@(2)=$$^%QZCHW("Charge.commande")_"^CHC",@MN@(2,"COM")=$$^%QZCHW("Charges des machines apres l'evaluation des delais")
 S @MN@(3)=$$^%QZCHW("Transfert.machines")_"^TRF",@MN@(3,"COM")=$$^%QZCHW("Transfert des charges")
 Q
 
MENI(MN) 
 K @(MN)
 S @MN="21^15^79"
 S @MN@(1)=$$^%QZCHW("IRD.carnet")_"^IRD",@MN@(1,"COM")=$$^%QZCHW("Calcul de l'IRD sur tout le carnet jalonne")
 S @MN@(2)=$$^%QZCHW("IRD.commande")_"^IRDC",@MN@(2,"COM")=$$^%QZCHW("Calcul de l'IRD sur les articles de l'etude")
 Q
 
MENF(MN) 
 K @(MN)
 S @MN="21^15^79"
 S @MN@(1)=$$^%QZCHW("Flux.carnet")_"^FLC",@MN@(1,"COM")=$$^%QZCHW("Visualisation du flux sur le carnet (ou une partie)")
 S @MN@(2)=$$^%QZCHW("Flux.commande")_"^FLE",@MN@(2,"COM")=$$^%QZCHW("Visualisation du flux sur la commande")
 Q
 
MOD(ETU) 
 N RESUL,PATOUCH,ABENDSCR,CMS,OR,AFRESU,SCR
 S RESUL(1)=ETU,SCR="DLETUDE",(ABENDSCR,CMS)=0
 D POCLEPA^%VVIDEO,LOAD^%DLETUD2(ETU,.RESUL),^%VAFIGRI,^%VAFISCR
 D MOD^%DLETUDE(.RESUL)
 Q
 
TETE(IMP) 
 N ART,COM,DEL,I,IOD,ICD,REPL,QTE
 S COM=$$^%QSCALVA(REPE,ETU,"COMMENTAIRE")
 F I="IOD","ICD" S @I=$S($D(^[QUI]RQSDON("JALON","IRD",I,ETU)):^[QUI]RQSDON("JALON","IRD",I,ETU),1:"Inconnu")
 I LAN="" G T2
 S REPL=$$LAN^%DLCON2
 S ART=$$^%QSCALVA(REPL,LAN,$$LIEN1^%QSGEL2(REPL,$$ART^%DLCON2,3))
 S QTE=$$^%QSCALVA(REPL,LAN,"QUANTITE")
 S DEL=$$AFFI^%QMDAUC(REPL,$$DELAI^%DLCON2,$$^%QSCALVA(REPL,LAN,$$DELAI^%DLCON2))
T2 I IMP=1 G IMPR
 D ^%VZCDB($$^%QZCHW("Activation de l'etude")_" "_ETU,0)
 S DX=0,DY=1 X XY W $E(COM,1,45)
 S DX=48 X XY W "/ ICD = ",ICD,", IOD = ",IOD
 I LAN="" S DY=2,DX=0 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Liste de lancements") D NORM^%VVIDEO W " ",NL Q
 S DY=2,DX=0 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Article") D NORM^%VVIDEO W " ",$E(ART,1,40)
 S DX=50 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Quantite") D NORM^%VVIDEO W " ",QTE
 S DX=63 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Delai") D NORM^%VVIDEO W " ",DEL
 Q
IMPR 
 S %FONC="MOUV",%9X=EX,%9Y=3010 D ^%PBPZ
 I LAN="" S %FONC="TEXT",%9STR=$$^%QZCHW("Liste de lancements")_" : "_NL D ^%PBPZ G IM2
 S %FONC="TEXT",%9STR=$$^%QZCHW("Article")_" : "_$E(ART,1,50) D ^%PBPZ
 S %FONC="MOUV",%9X=EX*50,%9Y=3010 D ^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("Quantite")_" "_QTE D ^%PBPZ
 S %FONC="MOUV",%9X=EX*60,%9Y=3010 D ^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("Delai.demande")_" "_DEL D ^%PBPZ
IM2 S %FONC="MOUV",%9X=EX,%9Y=2920 D ^%PBPZ
 S %FONC="TEXT",%9STR=$E(COM,1,50) D ^%PBPZ
 S %FONC="MOUV",%9X=EX*50,%9Y=2920 D ^%PBPZ
 S %FONC="TEXT",%9STR="*** ICD = "_ICD_" *** IOD = "_IOD_" ***" D ^%PBPZ
 S %FONC="MOUV",%9X=EX,%9Y=2830 D ^%PBPZ
 S %FONC="TEXT",%9STR=$$^%QZCHW("Flux jalonne pour l'etude")_" "_ETU,%9X=EX D ^%PBPZ
 S %FONC="MOUV",%9X=EX*50,%9Y=2830 D ^%PBPZ
 S %FONC="TEXT",%9STR="Le "_$$DATE^%QMDATE_" a "_$$HEURE^%QMDATE D ^%PBPZ
 
 S %FONC="SEGMENT",%9X1=0,%9Y1=MY,%9X2=4090,%9Y2=MY D ^%PBPZ
 Q

