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

;%QMEAMOD^INT^1^59547,73877^0
QMEAMOD ;
 
 
 
 K @(TEMPO)
 S @TEMPO@(1)="MN",@TEMPO@(2)="AD",@TEMPO@(3)="CONTR"
 S @TEMPO@(4)="SCR",@TEMPO@(5)="I",@TEMPO@(6)="ORD",@TEMPO@(7)="REP"
 S @TEMPO@(8)="TEMP",@TEMPO@(9)="UC",@TEMPO@(10)="PRESENT"
 S @TEMPO@(11)="OPRESENT",@TEMPO@(12)="ABENDSCR",@TEMPO@(13)="COMM"
 S @TEMPO@(14)="TOUCH",@TEMPO@(15)="ORD2",@TEMPO@(19)="GLOATT"
 S @TEMPO@(16)="V",@TEMPO@(17)="Y1",@TEMPO@(18)="ORDN"
 S @TEMPO@(20)="LIBNOT",@TEMPO@(21)="CTR",@TEMPO@(22)="GLO"
 S @TEMPO@(23)="SEAFF"
 D EMPV^%ANGEPIL(TEMPO)
 S REP="SAISIE.I"
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 S TEMP=$$CONCAS^%QZCHAD(TEMPB,"MENUS") K @(TEMP)
 I UC="VAX" S MN="MENU1"
 E  S MN=$$CONCAS^%QZCHAD(TEMP,"MENU1")
 S GLOATT=$$CONCAS^%QZCHAD(TEMPB,"GLOATT")
 D CLEPAG^%VVIDEO,^%VZEATT S TOUCH=0
 
 S COMM=$$^%QSCALVA(REP,S,"COMMENTAIRE")
 S PRESENT=$$^%QSCALVA(REP,S,"PRESENTATION")
 S OPRESENT=$$OR^%QSCALVA(REP,S,"PRESENTATION",PRESENT)
 S SEAFF=$$^%QSCALVA(REP,S,"SENS.AFFICHAGE")
 S:SEAFF="" SEAFF="H"
 K @(GLOATT)
 D MVG^%QSCALVA(REP,S,"ATTRIBUT",GLOATT,.Y1)
OATTF S ORD="" K CATT
BATT S ORD=$O(@GLOATT@(ORD))
 G:ORD="" FSTIN
 S @GLOATT@(ORD,"LONGUEUR")=$$^%QSCALIN(REP,S,"LONGUEUR",ORD)
 I @GLOATT@(ORD,"LONGUEUR")="" S @GLOATT@(ORD,"LONGUEUR")=15
 S @GLOATT@(ORD,"VALEUR.DEFAUT")=$$^%QSCALIN(REP,S,"VALEUR.DEFAUT",ORD)
 S %numord=$$^%QSCALIN(REP,S,"NUMERO.ORDRE",ORD) I %numord="" S %numord=1
 
 S @GLOATT@(ORD,"NUMERO.ORDRE")=%numord,CATT(@GLOATT@(ORD),@GLOATT@(ORD,"NUMERO.ORDRE"))=ORD
 S @GLOATT@(ORD,"INDICE.NOTE")=$$^%QSCALIN(REP,S,"INDICE.NOTE",ORD)
 S @GLOATT@(ORD,"AIDE")=$$^%QSCALIN(REP,S,"AIDE",ORD)
 S ORD2=ORD*100000,I=1
BVALEG S ORD2=$O(^[QUI]QUERY3(REP,S,ORD2))
 G:(ORD2\100000)'=ORD BATT
 S @GLOATT@(ORD,"VALEUR.LEGALE",(ORD*100000)+I)=$$^%QSCALIN(REP,S,"VALEUR.LEGALE",ORD2)
 S I=I+1
 G BVALEG
FSTIN D POCLEPA^%VVIDEO
TITRE 
 K RESUL S RESUL(1)=S
 D AFF^%VACTGRQ("QMEASGM",.RESUL)
 
CDIAL2 D MENU2(MN)
 S DX=1,DY=4 D CLEBAS^%VVIDEO
DIAL2 
 D POCLEPA^%VVIDEO
 D ^%VQUIKMN(0,80,23,MN,.AD,.CONTR) G:(CONTR="A")!(CONTR="F") STOCK
 I AD'="" G @AD
 G DIAL2
 
MODAF 
 D POCLEPA^%VVIDEO
 K RESUL S RESUL(1)=S,RESUL(2)=SEAFF
 D AFF^%VACTGRQ("QMEASAF",.RESUL)
 G:ABENDSCR CDIAL2
 I RESUL(2)'=SEAFF S SEAFF=RESUL(2),TOUCH=1
 G CDIAL2
 
COMM 
 K RESUL
 S RESUL(1)=S,RESUL(2)=COMM
 D AFF^%VACTGRQ("QMEASCO",.RESUL)
 G:ABENDSCR DIAL2
 I RESUL(2)'=COMM S COMM=RESUL(2),TOUCH=1
 G DIAL2
 
PRES 
 S GLO="ESSAI",ORDN=""
 S V=PRESENT
 I V="" S LIBNOT=$$^%QZCHW("Nom de la nouvelle note ? ") G PRES2
 S ORDN=OPRESENT
 S LIBNOT=$$^%QZCHW("Nouveau titre de la note ou")_" (RETURN) : "
PRES2 D POCLEPA^%VVIDEO W LIBNOT
 S Y1=PRESENT
 D GET^%VLECFL2(Y1,$X,$Y,$X-1,80,.CTR,.Y1)
 G:CTR="A" DIAL2 G:Y1="" PRES2
 S V=Y1
 D ^%QSNOTE("M",1,8,78,15,"SAISIE.I",S,"PRESENTATION",.V,.ORDN,.GLO,0)
 K @(GLO)
 G:(V="")!(ORDN="") DIAL2
 G:(V=PRESENT)&(ORDN=OPRESENT) DIAL2
 S TOUCH=1,PRESENT=V,OPRESENT=ORDN
 G DIAL2
ATTR 
 D EMPIL^%ANGEPIL("RETATT^%QMEAMOD") G ^%QMEAMAT
RETATT 
 G CDIAL2
 
 
STOCK 
 I TOUCH=0 G DEPIL^%ANGEPIL
 D ^%VZEATT
 
 
 D PA^%QSGESTI(REP,S,"COMMENTAIRE",COMM,1)
 D PA^%QSGESTI(REP,S,"SENS.AFFICHAGE",SEAFF,1)
 D PA^%QSGESTI(REP,S,"PRESENTATION",PRESENT,OPRESENT)
 F V="ATTRIBUT","VALEUR.DEFAUT","LONGUEUR","NUMERO.ORDRE","INDICE.NOTE","AIDE","VALEUR.LEGALE" D PSV^%QSGESTI(REP,S,V)
 S ORD=""
BORD S ORD=$O(@GLOATT@(ORD))
 I ORD="" G DEPIL^%ANGEPIL
 D PA^%QSGESTI(REP,S,"ATTRIBUT",@GLOATT@(ORD),ORD)
 D PA^%QSGESTI(REP,S,"VALEUR.DEFAUT",@GLOATT@(ORD,"VALEUR.DEFAUT"),ORD)
 D PA^%QSGESTI(REP,S,"LONGUEUR",@GLOATT@(ORD,"LONGUEUR"),ORD)
 D PA^%QSGESTI(REP,S,"NUMERO.ORDRE",@GLOATT@(ORD,"NUMERO.ORDRE"),ORD)
 D PA^%QSGESTI(REP,S,"INDICE.NOTE",@GLOATT@(ORD,"INDICE.NOTE"),ORD)
 D PA^%QSGESTI(REP,S,"AIDE",@GLOATT@(ORD,"AIDE"),ORD)
 S ORD2=""
SVV S ORD2=$O(@GLOATT@(ORD,"VALEUR.LEGALE",ORD2))
 G:ORD2="" BORD
 D PA^%QSGESTI(REP,S,"VALEUR.LEGALE",@GLOATT@(ORD,"VALEUR.LEGALE",ORD2),ORD2)
 G SVV
 
STOCP(I,A,V,O) 
 D PA^%QSGESTI("SAISIE.I",I,A,V,O)
 Q
 
MENU(MEN) 
 K @(MEN)
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("Consulter")_"^CONS"
 S @MEN@(1,"COM")=$$^%QZCHW("Consultation de valeurs legales")
 S @MEN@(2)=$$^%QZCHW("Ajouter")_"^AJ"
 S @MEN@(2,"COM")=$$^%QZCHW("Ajout de valeurs legales")
 S @MEN@(3)=$$^%QZCHW("Modifier")_"^MODIF"
 S @MEN@(3,"COM")=$$^%QZCHW("Modification de valeurs legales")
 S @MEN@(4)=$$^%QZCHW("Supprimer")_"^SUP"
 S @MEN@(4,"COM")=$$^%QZCHW("Suppression de valeurs legales")
 Q
MENU2(MEN) 
 K @(MEN)
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("Presentation")_"^PRES"
 S @MEN@(1,"COM")=$$^%QZCHW("Acces au texte de presentation")
 S @MEN@(2)=$$^%QZCHW("Parametres")_"^ATTR"
 S @MEN@(2,"COM")=$$^%QZCHW("Acces aux attributs et variables temporaires")
 S @MEN@(3)=$$^%QZCHW("Commentaire")_"^COMM"
 S @MEN@(3,"COM")=$$^%QZCHW("Acces au commentaire")
 S @MEN@(4)=$$^%QZCHW("Mode d'affichage")_"^MODAF"
 S @MEN@(4,"COM")=$$^%QZCHW("Choix du sens de l'affichage (H/V)")
 Q
 
AJ(S) 
 N RESUL,ABENSCR
 S RESUL(1)=S
 D CLEPAG^%VVIDEO,AFF^%VACTGRQ("QMEASG",.RESUL)
 S S=RESUL(1)
 I (S="")!ABENDSCR S S="" Q
 D PA^%QSGESTI("SAISIE.I",S,"NOM",S,1)
 Q

