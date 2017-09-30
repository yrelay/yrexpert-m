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

;%QMEASA1^INT^1^59547,73878^0
QMEASA1 ;
 
 
 
 
AJ 
 N %I,MN,MENU1,AD,CONTR,RESUL,ABENDSCR,TEMP,UC,BASE
 N S,GLO,ORD,IND,AT,ORDAT,NOGR,TOUCH,INDVL,V
 S BASE="SAISIE.I"
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 I UC="VAX" S MN="MENU1"
 I UC'="VAX" S MN=$$CONCAS^%QZCHAD(TEMP,"MENU1")
 S IND=0,INDVL=0
 K RESUL
AJ1 D CLEPAG^%VVIDEO
AJ2 D AFF^%VACTGRQ("QMEASG",.RESUL)
 S S=RESUL(1)
 
 G:(S="")!ABENDSCR @RETOUR
 I $$IR^%QSGEST5(BASE,S) D ^%VZEAVT($$^%QZCHW("Cette SAISIE existe deja")) G AJ2
 D MENU2(MN)
 G DIAL2
CDIAL2 D MENU2(MN)
DIAL2 D POCLEPA^%VVIDEO
 D ^%VQUIKMN(0,80,23,MN,.AD,.CONTR) G:(CONTR="A")!(CONTR="F") @RETOUR
 I AD'="" G @AD
 G DIAL2
FIN 
 Q
 
MODAF 
 D POCLEPA^%VVIDEO
 K RESUL S RESUL(1)=S,RESUL(2)="H"
 D AFF^%VACTGRQ("QMEASAF",.RESUL)
 G:ABENDSCR CDIAL2
 D STOCP(S,"SENS.AFFICHAGE",RESUL(2),1)
 G CDIAL2
 
PRES 
 S GLO="ESSAI" K @(GLO)
 S V=$$^%QSCALVA(BASE,S,"PRESENTATION")
 S ORD=$$OR^%QSCALVA(BASE,S,"PRESENTATION",V)
PRES2 D ^%QSNOTE("M",1,8,78,15,BASE,S,"PRESENTATION",.V,.ORD,.GLO,0)
 K @(GLO)
 G:(V="")!(ORD="") DIAL2
 D STOCP(S,"PRESENTATION",V,ORD)
 G DIAL2
 
COMM 
 D POCLEPA^%VVIDEO
 K RESUL S RESUL(1)=S
 D AFF^%VACTGRQ("QMEASCO",.RESUL)
 G:ABENDSCR CDIAL2
 D STOCP(S,"COMMENTAIRE",RESUL(2),1)
 G CDIAL2
 
ATTR 
 D POCLEPA^%VVIDEO
 K RESUL S RESUL(1)=S
 S RESUL(7)=$$^%QZCHW("Ajouter")
ATTR2 D AFF^%VACTGRQ("QMEASAT",.RESUL)
 S AT=RESUL(2)
 G:(AT="")!ABENDSCR FINATTR
 S IND=RESUL(4)
 S ORDAT=RESUL(3)
 
 S:ORDAT="" ORDAT=1
 I IND="" D ^%VZEAVT($$^%QZCHW("Il manque l'ordre d'affichage")) G ATTR2
 I $$OVAIR^%QSGE5(BASE,S,"ATTRIBUT",AT,ORDAT) D ^%VZEAVT($$^%QZCHW("Parametre deja defini avec le meme numero d'ordre")) G ATTR2
 I $$OAIR^%QSGE5(BASE,S,"ATTRIBUT",IND) D ^%VZEAVT($$^%QZCHW("Un parametre a deja ete defini pour cette place d'affichage")) G ATTR2
 D STOCP(S,"ATTRIBUT",AT,IND)
 D STOCP(S,"NUMERO.ORDRE",ORDAT,IND)
 D STOCP(S,"VALEUR.DEFAUT",RESUL(6),IND)
 D STOCP(S,"LONGUEUR",RESUL(5),IND)
 S NOGR=1
CDIAL3 D MENU3(MN)
DIAL3 D POCLEPA^%VVIDEO
 D ^%VQUIKMN(0,80,23,MN,.AD,.CONTR) G:(CONTR="A")!(CONTR="F") ATTR
 I AD'="" G @AD
 G DIAL3
FINATTR K RESUL
 S RESUL(1)=S D AFF^%VACTGRQ("QMEASGM",.RESUL)
 G CDIAL2
 
VALL 
 K RESUL
 S INDVL=0
 S RESUL(1)=S,RESUL(2)=IND,RESUL(3)=NOGR
 S RESUL(24)=$$^%QZCHW("Ajouter")
 D AFF^%VACTGRQ("QMEASVL",.RESUL)
 G:ABENDSCR DIAL3
 S TOUCH=0
 F %I=4:2:22 S:RESUL(%I)'="" INDVL=INDVL+1 D STOCP(S,"VALEUR.LEGALE",RESUL(%I),((IND*100000)+((NOGR-1)*20))+INDVL) S TOUCH=1
 S:TOUCH=1 NOGR=NOGR+1
 G DIAL3
 
AIDE 
 S GLO="ESSAI" K @(GLO)
 S V=$$^%QSCALIN(BASE,S,"AIDE",IND)
 S ORD=$$^%QSCALIN(BASE,S,"INDICE.NOTE",IND)
AIDE2 D ^%QSNOTE("M",1,9,78,14,BASE,S,"AIDE",.V,.ORD,.GLO,0)
 K @(GLO)
 G:(V="")!(ORD="") DIAL3
 D STOCP(S,"AIDE",V,IND)
 D STOCP(S,"INDICE.NOTE",ORD,IND)
 G DIAL3
 
STOCP(I,A,V,O) 
 D PA^%QSGESTI("SAISIE.I",I,A,V,O)
 Q
 
 
MENU2(MEN) 
 K @(MEN)
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("Presentation")_"^PRES"
 S @MEN@(1,"COM")=$$^%QZCHW("Acces au texte de presentation")
 S @MEN@(2)=$$^%QZCHW("Parametres")_"^ATTR"
 S @MEN@(2,"COM")=$$^%QZCHW("Definition des attributs et variables temporaires")
 S @MEN@(3)=$$^%QZCHW("Commentaires")_"^COMM"
 S @MEN@(3,"COM")=$$^%QZCHW("Acces au commentaire")
 S @MEN@(4)=$$^%QZCHW("Mode d'affichage")_"^MODAF"
 S @MEN@(4,"COM")=$$^%QZCHW("Choix du sens de l'affichage (H/V)")
 Q
MENU3(MEN) 
 K @(MEN)
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("Aide")_"^AIDE"
 S @MEN@(1,"COM")=$$^%QZCHW("Acces au texte d'aide")
 S @MEN@(2)=$$^%QZCHW("Valeurs legales")_"^VALL"
 S @MEN@(2,"COM")=$$^%QZCHW("Definition des valeurs legales")
 Q

