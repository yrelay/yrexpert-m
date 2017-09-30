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

;%QMEAMAT^INT^1^59547,73877^0
QMEAMAT ;
 
 K @(TEMPO)
 S @TEMPO@(1)="NOGR",@TEMPO@(2)="VAL",@TEMPO@(3)="ABENDSCR"
 S @TEMPO@(4)="AT2",@TEMPO@(5)="IN2",@TEMPO@(6)="ORD2"
 S @TEMPO@(7)="BASE",@TEMPO@(8)="SIND",@TEMPO@(9)="ATT"
 S @TEMPO@(10)="OSAI",@TEMPO@(11)="OSAI2",@TEMPO@(12)="NT"
 S @TEMPO@(13)="V",@TEMPO@(14)="GLO",@TEMPO@(15)="Y1"
 S @TEMPO@(16)="VD",@TEMPO@(17)="LON",@TEMPO@(18)="LIBACT"
 S @TEMPO@(19)="AT",@TEMPO@(20)="IND",@TEMPO@(21)="ACT"
 D EMPV^%ANGEPIL(TEMPO)
ATTR2 
 S LIBACT=$$^%QZCHW("Consulter")
 D AFFATT^%QMEAUT(1)
 I ABENDSCR D AFFSAI^%QMEAUT G DEPIL^%ANGEPIL
 S AT=RESUL(2),IND=RESUL(4),ORDAT=RESUL(3),VD=RESUL(6),LON=RESUL(5)
 I AT="?" S (IND,ORDAT,VD)="" D CHOATT^%QMEAUT(.AT) I AT="" G ATTR2
 I '($$CHERCHAT^%QMEAUT(.AT,.IND,.ORDAT)) S RESUL(2)=AT,RESUL(4)=IND,RESUL(3)=ORDAT G ATTR2
 S LIBACT=$$^%QZCHW("Modifier/Creer")
 I ORDAT="" S RESUL(3)=1,ORDAT=1
ATTR4 
 S:$D(@GLOATT@(IND,"VALEUR.DEFAUT")) (VD,RESUL(6))=@GLOATT@(IND,"VALEUR.DEFAUT")
 S:$D(@GLOATT@(IND,"LONGUEUR")) (LON,RESUL(5))=@GLOATT@(IND,"LONGUEUR")
ATTR3 D AFFATT^%QMEAUT(0)
 I ABENDSCR G ATTR2
 S:RESUL(3)="" RESUL(3)=1
 S:RESUL(5)="" RESUL(5)=15
 I ((RESUL(2)=AT)&(RESUL(4)=IND))&(RESUL(3)=ORDAT) D NOUVEAU^%QMEAUT G DIAL2
 G:(RESUL(2)=AT)&(RESUL(3)=ORDAT) MIND
 I RESUL(2)="" D M("Le champ parametre doit etre rempli") G ATTR3
 I $D(CATT(RESUL(2),RESUL(3))) D M("Ce couple parametre/numero d'ordre est deja defini") G ATTR3
 S TOUCH=1
 S @GLOATT@(IND)=RESUL(2),CATT(RESUL(2),RESUL(3))=IND,@GLOATT@(IND,"NUMERO.ORDRE")=RESUL(3),@GLOATT@(IND,"VALEUR.DEFAUT")=RESUL(6),@GLOATT@(IND,"LONGUEUR")=RESUL(5)
 K CATT(AT,ORDAT)
 S ORDAT=RESUL(3),AT=RESUL(2)
 G:RESUL(4)=IND DIAL2
MIND I RESUL(4)="" D M("Le champ ordre d'affichage doit etre rempli") G ATTR3
 I $D(@GLOATT@(RESUL(4))) D M("Cette place d'affichage est deja utilisee") G ATTR3
 
 S TOUCH=1
 S CATT(AT,ORDAT)=RESUL(4),@GLOATT@(RESUL(4))=AT,@GLOATT@(RESUL(4),"NUMERO.ORDRE")=ORDAT,@GLOATT@(RESUL(4),"VALEUR.DEFAUT")=RESUL(6),@GLOATT@(RESUL(4),"LONGUEUR")=RESUL(5)
 I $D(@GLOATT@(IND,"AIDE")) S @GLOATT@(RESUL(4),"AIDE")=@GLOATT@(IND,"AIDE"),@GLOATT@(RESUL(4),"INDICE.NOTE")=@GLOATT@(IND,"INDICE.NOTE")
 I '($D(@GLOATT@(IND,"AIDE"))) S @GLOATT@(RESUL(4),"AIDE")="",@GLOATT@(RESUL(4),"INDICE.NOTE")=""
 D VL^%QMEAUT(IND,RESUL(4))
 K @GLOATT@(IND)
 S IND=RESUL(4)
DIAL2 
CDIAL3 D MENU3^%QMEAUT(MN)
DIAL3 D POCLEPA^%VVIDEO
 D ^%VQUIKMN(0,80,23,MN,.AD,.CONTR) G:(CONTR="A")!(CONTR="F") ATTR2
 I AD'="" G @AD
 G DIAL3
SUPP 
 D POCLEPA^%VVIDEO
 I '($$CONFIRM^%VZEOUI("Confirmez-vous la suppression ?")) G DIAL3
 K @GLOATT@(IND),CATT(AT,ORDAT)
 S TOUCH=1
 G ATTR2
DUPLI 
 D POCLEPA^%VVIDEO
 S AT2=$$^%VZAME1($$^%QZCHW("Nom du nouveau parametre")_" ?")
 G:AT2="" DIAL3
 D POCLEPA^%VVIDEO
 S ORD2=$$^%VZAME1($$^%QZCHW("Numero d'ordre de ce parametre")_" ?")
 I ORD2="" S ORD2=1
 I $D(CATT(AT2,ORD2)) D M("Parametre deja existant") G DUPLI
DUPLI2 
 D POCLEPA^%VVIDEO S IN2=$$^%VZAME1($$^%QZCHW("Place d'affichage du parametre")_" ?")
 I IN2="" G DIAL3
 I $D(@GLOATT@(IN2)) D M("Place deja occupee") G DUPLI2
 D POCLEPA^%VVIDEO
 G:'($$MES^%VZEOUI($$^%QZCHW("Confirmez-vous la duplication de ")_AT2_"("_ORD2_")"_$$^%QZCHW(" en place ")_IN2_" ?","N")) DIAL3
 S TOUCH=1
 S CATT(AT2,ORD2)=IN2
 S @GLOATT@(IN2)=AT2,@GLOATT@(IN2,"NUMERO.ORDRE")=ORD2,@GLOATT@(IN2,"VALEUR.DEFAUT")=@GLOATT@(IND,"VALEUR.DEFAUT"),@GLOATT@(IN2,"LONGUEUR")=@GLOATT@(IND,"LONGUEUR")
 D VL^%QMEAUT(IND,IN2)
 S @GLOATT@(IN2,"AIDE")=@GLOATT@(IND,"AIDE")
 I @GLOATT@(IN2,"AIDE")="" S @GLOATT@(IN2,"INDICE.NOTE")="",AT=AT2,ORDAT=ORD2,IND=IN2 G DIAL3
 S SIND=IND,ATT="AIDE",NT=@GLOATT@(IN2,"AIDE")
 S BASE="SAISIE.I",IND=S,T="INDICE.NOTE",ACT="A"
 D SAISD^%QSNOTE(.OSAI)
 S IND=SIND
 S @GLOATT@(IN2,"INDICE.NOTE")=OSAI,OSAI2=@GLOATT@(IND,"INDICE.NOTE")
 D DUPL^%QSNOTE(BASE,S,OSAI2,QUI,S,OSAI)
 S AT=AT2,ORDAT=ORD2,IND=IN2
 G ATTR4
AIDE 
 S GLO="ESSAI",ORD2=""
 S V=@GLOATT@(IND,"AIDE")
 I V="" S LIBNOT=$$^%QZCHW("Nom de la nouvelle note ? ") G AIDE2
 S ORD2=@GLOATT@(IND,"INDICE.NOTE"),LIBNOT=$$^%QZCHW("nouveau titre de la note ou")_" (RETURN) : "
AIDE2 D POCLEPA^%VVIDEO W LIBNOT
 S Y1=V
 D GET^%VLECFL2(Y1,$X,$Y,$X-1,80,.CTR,.Y1)
 G:CTR="A" DIAL3 G:Y1="" AIDE2
 S V=Y1,DX=0,DY=9 X XY D CLEBAS^%VVIDEO
 D ^%QSNOTE("M",1,9,78,14,"SAISIE.I",S,"AIDE",.V,.ORD2,.GLO,0)
 K @(GLO)
 G:(V="")!(ORD2="") DIAL3
 G:(V=@GLOATT@(IND,"AIDE"))&(ORD2=@GLOATT@(IND,"INDICE.NOTE")) DIAL3
 S TOUCH=1
 S @GLOATT@(IND,"AIDE")=V,@GLOATT@(IND,"INDICE.NOTE")=ORD2
 G DIAL3
VALL 
 K RESUL
 S RESUL(1)=S,RESUL(2)=IND
 S RESUL(24)=$$^%QZCHW("Consulter")
 D AFF^%VACTGRQ("QMEASVL",.RESUL),POCLEPA^%VVIDEO
 G:ABENDSCR DIAL3
 S NOGR=RESUL(3) S:NOGR="" NOGR=1
 S VAL=""
 D COUNT^%QMEAUT(NOGR,.VAL) S VL=VAL,I=1
 F %V=4:2:22 S VL=$O(@GLOATT@(IND,"VALEUR.LEGALE",VL)) Q:VL=""  S RESUL(%V+1)=I,RESUL(%V)=@GLOATT@(IND,"VALEUR.LEGALE",VL),I=I+1
 S RESUL(3)=NOGR
 S RESUL(24)=$$^%QZCHW("Modifier/Creer")
 D AFF^%VACTGRQ("QMEASVL",.RESUL)
 G:ABENDSCR DIAL3
 S TOUCH=1
 D KILLGR^%QMEAUT(VAL)
 S I=1
 F %V=4:2:22 I RESUL(%V)'="" S @GLOATT@(IND,"VALEUR.LEGALE",(IND*100000)+(((NOGR-1)*10)+I))=RESUL(%V),I=I+1
 G DIAL3
 
M(M) D ^%VZEAVT($$^%QZCHW(M)) Q

