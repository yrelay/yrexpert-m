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

;%SDSCACT^INT^1^59547,73889^0
SDSCACT(COL,VERS,SOR,INTER,%PORT,%TERM,%DESSIN,AGR) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N XO0,YO0,XOC,YOC,ANGC,ECH0,ECHC,GENVO,TEMP,ERR,STO
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERREUR")
 
 D INITVAR D:INTER INITCOL^%SDOAFFI
 
 S STO=$$DEF^%SDCCMS(COL,VERS)
 G @("INTER"_INTER)
INTER1 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("activation d'une scene"),0)
 S GENVO=$$CONCAS^%QZCHAD(TEMP,"IND")
 
 D INDIV I '($D(@GENVO@("@"))) G FINACT
 
 D VARTEMP^%SDSCAC2
 G POINT
 
INTER0 
 S ECHC=ECHC*AGR
 S GENVO="CXT"
 G POINT
 
POINT 
 N BASE,OBJET
 S BASE=@GENVO@("@","BASE"),OBJET=@GENVO@("@","OBJET")
 D POINT^%SDSCAC2
 I '($D(@ERR)) G ACTIV
 I INTER=0 G ACTIV
 D AFFERR^%QULIMZ(ERR,$$^%QZCHW("erreurs dans le contexte d'interpretation"))
 S DX=0,DY=23 X XY
 S I=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous quand meme interpreter")_" ? ","N")
 D CLEPAG^%VVIDEO
 I I'=1 G FINACT
 D ^%VZCDB($$^%QZCHW("activation d'une scene"),0) H 2
 
ACTIV 
 I INTER=1 N %PORT,%TERM,%DESSIN D INIT^%SDSCIMP(SOR),CADRE^%SDOCADR
 N NOBJ,OBJ,VO
 N XO,YO,ANGO,ECHO,NUM
 S NOBJ=""
OBJ S NOBJ=$O(@STO@("OBJ",NOBJ))
 I NOBJ="" G FINACT
 
 S OBJ=$O(@STO@("OBJ",NOBJ,"R","")),VO=$O(@STO@("OBJ",NOBJ,"R",OBJ,""))
 S XO=@STO@("OBJ",NOBJ,"X")*188E-1
 S YO=@STO@("OBJ",NOBJ,"Y")*188E-1
 S ANGO=@STO@("OBJ",NOBJ,"ANG")
 S ECHO=@STO@("OBJ",NOBJ,"ECH")
 D INTERP^%SDOINTP(OBJ,VO,XO,YO,ANGO,ECHO,XOC,YOC)
 G OBJ
 
FINACT I INTER=1 D SX^%QSGESTK("%",$J),FIN^%SDSCIMP(SOR)
 
 D KILL^%QSGEST2("%"_$J)
 K @(TEMP)
 Q
 
INITVAR 
 S XO0=$$COOR^%SDXUTIL("X"),YO0=$$COOR^%SDXUTIL("Y")
 S ECH0=$$ECHELLE^%SDXUTIL
 
 S XOC=$$COOR^%SDCOCAR(COL,VERS,"X")*188E-1,YOC=$$COOR^%SDCOCAR(COL,VERS,"Y")*188E-1
 S ANGC=$$ANG^%SDCOCAR(COL,VERS),ECHC=$$ECH^%SDCOCAR(COL,VERS)
 Q
 
INDIV 
 
 I '($D(@TINT@("ATT"))) S @GENVO@("@","BASE")="",@GENVO@("@","OBJET")="" Q
 N %C,%R,ERR,PK,X,Y,GLO,I,VAL,ADRS
 D INIT
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL") K @(VAL)
 S ADRS=$$CONCAS^%QZCHAD(TEMP,"STO") K @(ADRS)
 S @VAL=$P(ADRS,")",1),@VAL@(2)=""
 I '($D(@STO@("IND","@"))) S @VAL@(1)="",@VAL@(3)=""
 I $D(@STO@("IND","@")) S @VAL@(1)=@STO@("IND","@","BA"),@VAL@(3)=@STO@("IND","@","O")
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 I ($D(@ADRS)#10)'=1 G FIN
 
 S @GENVO@("@","BASE")=$$NOMINT^%QSF($P(@ADRS,$C(0),1))
 S @GENVO@("@","OBJET")=$P(@ADRS,$C(0),3)
 
 S @STO@("IND","@","BA")=$P(@ADRS,$C(0),1)
 S @STO@("IND","@","O")=$P(@ADRS,$C(0),3)
FIN K @(ADRS),@(VAL)
 Q
 
INIT 
 S GLO=$$ADR
 I $D(@GLO) Q
 S @GLO=" "_$$^%QZCHW("Definition de l'individu de base")_" "
 S @GLO@("H")=10,@GLO@("V")=10,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=3,@GLO@("L")=50,@GLO@("PLL")=10
 S @GLO@("CHAMPS",1)=$$^%QZCHW("Repertoire"),@GLO@("CHAMPS",2)=" "
 S @GLO@("CHAMPS",3)=$$^%QZCHW("Individu")
 S @GLO@("POP1")="",@GLO@("POP2")=""
 F I=1:1:3 S @GLO@("LARG",I)=50
 S @GLO@("SUIV",1)=3,@GLO@("PREC",1)=3,@GLO@("SUIV",3)=1,@GLO@("PREC",3)=1
 F I=1:1:3 S @GLO@("FORMAT",I)="S OK=1"
 F I=1:1:3 S @GLO@("OBLIGAT",I)="S OK=(VAL'="""")",@GLO@("VALEG",I,0)="S OK=2"
 S @GLO@("UCONT.CHAMPS",1)="D LREP^%SDSCACT",@GLO@("UCONT.CHAMPS",3)="D LIND^%SDSCACT"
 Q
 
ADR() 
 Q "^SAVMASQ(""SD"",""COL"",""ACT"")"
 
LREP 
 I $$GETLBLAN^%VTLBLAN(X)'="?" S OK=$$REPM^%QSGEST9(X)=2 D:OK=0 MESS^%PKUTIL(10,21,$$^%QZCHW("Ce repertoire n'existe pas"),1) Q
 N REP
 S REP=$$UN^%PKCHOIX("^[QUI]RQSAUTOR(WHOIS)",2,5,15)
 S DX=0,DY=4 D CLEBAS^%VVIDEO
 S X=REP
 S:REP="" OK=0
 S REUC=1
 Q
 
LIND 
 I $$GETLBLAN^%VTLBLAN(VAL(1))="" S OK=0 Q
 N REP
 S REP=$$NOMINT^%QSF(VAL(1))
 I $$GETLBLAN^%VTLBLAN(X)'="?" S OK=$$IR^%QSGE5(REP,X) D:OK=0 MESS^%PKUTIL(10,21,$$^%QZCHW("Cet individu n'existe pas"),1) Q
 N IND
 S IND=$$UN^%PKCHOIX($$LISTIND^%QSGEST6(REP),2,5,15)
 S DX=0,DY=4 D CLEBAS^%VVIDEO
 S X=IND
 S REUC=1
 S:IND="" OK=0
 Q

