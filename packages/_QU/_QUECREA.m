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

;%QUECREA^INT^1^59547,73885^0
QUECREA ;
 
 
 
 
 
 N ECR,I,TEMP,MEN,MENMOD
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 S MENMOD=$$CONCAS^%QZCHAD(TEMP,"MENMOD")
 S MENFOND=$$CONCAS^%QZCHAD(TEMP,"MENFOND")
 S MENTFOND=$$CONCAS^%QZCHAD(TEMP,"MENTFOND")
 S MENMAFF=$$CONCAS^%QZCHAD(TEMP,"MENMAFF")
 D 80^%VVIDEO
 D CLEPAG^%VVIDEO
 D MEN(MEN)
 S ECR=$$ECR^%QUECZ1
 F I=0:0 Q:$$SEL^%QUECZ2(MEN,0)
 K @(TEMP)
 Q
 
MOD1(CL,MENMOD,MENFOND) 
 D MENMOD(MENMOD)
 F I=0:0 Q:$$SEL^%QUECZ2(MENMOD,0)
 Q
 
 
FOND N FG,A
 S FG=$$FGLOB^%QUECZ1(CL)
 I '($D(@FG)) D ^%VZEAVT("Veuillez definir la fenetre englobante") Q
 D MENFOND(MENFOND)
 D ^%QUECAFF(CL,"","",0)
 F I=0:0 Q:$$SEL^%QUECZ2(MENFOND,0)  D ^%QUECAFF(CL,"","",0)
 Q
 
FDCREA N FD,FD1
 D FD(CL,.FD,.CTR) Q:CTR="A"  Q:FD=""
 S FD1=$$FD1^%QUECZ1(CL,FD)
 I $D(@FD1) D ^%VZEAVT("Fond deja existant") Q
 D MENTFOND(MENTFOND)
 F I=0:0 Q:$$SEL^%QUECZ2(MENTFOND,1)
 Q
 
FDREC N A,XG,YH,H,L
 S A=$$RECT^%QUECR(@FG@("XG"),@FG@("YH"),@FG@("L"),@FG@("H"),.XG,.YH,.L,.H)
 F I="XG","YH","H","L" S @FD1@(I)=@I
 S @FD1@("TYPE")="RECTANGLE"
 Q
 
FDCOM N A,COMM,IND,XG,YH
 D MIRE^%QUECZ("NOLIB",@FG@("XG")-1,@FG@("XG")+@FG@("L"),@FG@("YH")-1,@FG@("YH")+@FG@("H"),.COMM,.XG,.YH)
 D LIRE1^%VREAD("","",XG,YH,.CTR,.COMM) Q:CTR="A"  Q:COMM=""
 F I="XG","YH" S @FD1@(I)=@I
 S @FD1@("TYPE")="COMMENTAIRE"
 S @FD1@("LIB")=COMM
 D MENMAFF(MENMAFF)
 F IND=1:1 Q:$$SEL^%QUECZ2(MENMAFF,0)
 Q
 
AFFBLD N ADR
 S ADR=$$MODAFF^%QUECZ1(CL,FD)
 S @ADR@(IND)="BLD"
 Q
AFFBLK N ADR
 S ADR=$$MODAFF^%QUECZ1(CL,FD)
 S @ADR@(IND)="BLK"
 Q
AFFUDL N ADR
 S ADR=$$MODAFF^%QUECZ1(CL,FD)
 S @ADR@(IND)="UDL"
 Q
AFFBIG N ADR
 S ADR=$$MODAFF^%QUECZ1(CL,FD)
 S @ADR@(IND)="BIG"
 Q
AFFREV N ADR
 S ADR=$$MODAFF^%QUECZ1(CL,FD)
 S @ADR@(IND)="REV"
 Q
 
FDSUP N FD,FD1
 D FD(CL,.FD,.CTR) Q:CTR="A"  Q:FD=""
 S FD1=$$FD1^%QUECZ1(CL,FD)
 I '($D(@FD1)) D ^%VZEAVT("Fond inconnu") Q
 K @(FD1)
 Q
 
FGL N A,XG,YH,H,L,FGLOB,I
 S A=$$RECT^%QUECR(0,0,80,22,.XG,.YH,.L,.H)
 I A=1 Q
 
 I (H<2)!(L<2) Q
 S FGLOB=$$FGLOB^%QUECZ1(CL)
 F I="XG","YH","H","L" S @FGLOB@(I)=@I
 Q
LECR I RM=80 D 132^%VVIDEO Q
 I RM=132 D 80^%VVIDEO Q
 Q
 
CREA D CL(.CL,.CTR)
 I (CTR="A")!(CTR="F") Q
 Q:CL=""
 I $D(@ECR@(CL))'=0 D ^%VZEAVT("Ecran deja existant") Q
 D MOD1(CL,MENMOD,MENFOND)
 Q
 
MOD D CL(.CL,.CTR)
 I (CTR="A")!(CTR="F") Q
 Q:CL=""
 I $D(@ECR@(CL))=0 D ^%VZEAVT("Ecran inconnu") Q
 D MOD1(CL,MENMOD,MENFOND)
 Q
 
SUPEC D CL(.CL,.CTR)
 I (CTR="A")!(CTR="F") Q
 Q:CL=""
 I $D(@ECR@(CL))=0 D ^%VZEAVT("Ecran inconnu") Q
 K @ECR@(CL)
 Q
 
MEN(MEN) 
 N I
 K @(MEN) S I=1
 S @MEN@(I)=$$^%QZCHW("creation d'un ecran")_"^"_"CREA^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("consulter/modifier un ecran")_"^"_"MOD^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("suppression d'un ecran")_"^"_"SUPEC^%QUECREA",I=I+1
 Q
MENMOD(MEN) 
 N I
 K @(MEN) S I=1
 S @MEN@(I)=$$^%QZCHW("champ")_"^"_"CHAMPS^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("fond")_"^"_"FOND^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("fenetre englobante")_"^"_"FGL^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("largeur ecran")_"^"_"LECR^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("compilation")_"^"_"COMP^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("connexion")_"^"_"CNX^%QUECREA",I=I+1
 Q
MENFOND(MEN) 
 N I
 K @(MEN) S I=1
 S @MEN@(I)=$$^%QZCHW("creation d'un fond")_"^"_"FDCREA^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("suppression d'un fond")_"^"_"FDSUP^%QUECREA",I=I+1
 Q
MENTFOND(MEN) 
 N I
 K @(MEN) S I=1
 S @MEN@(I)=$$^%QZCHW("rectangle")_"^"_"FDREC^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("commentaire")_"^"_"FDCOM^%QUECREA",I=I+1
 Q
MENMAFF(MEN) 
 N I
 K @(MEN) S I=1
 S @MEN@(I)=$$^%QZCHW("Bold")_"^"_"AFFBLD^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("Reverse")_"^"_"AFFREV^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("Blink")_"^"_"AFFBLK^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("Underline")_"^"_"AFFUDL^%QUECREA",I=I+1
 S @MEN@(I)=$$^%QZCHW("Big")_"^"_"AFFBIG^%QUECREA",I=I+1
 Q
 
 
CL(CL,CTR) 
 D LIRE1^%VREAD($$^%QZCHW("Ecran")_" : ","",0,23,.CTR,.CL)
 Q
 
FD(CL,FD,CTR) 
 D LIRE1^%VREAD($$^%QZCHW("Fond")_" : ","",0,23,.CTR,.FD)
 Q
 
CHAMPS D ^%QUECREA1(CL) Q
 
COMP D ^%QUECP(CL) Q
 
CNX D ^%QUECREA3(CL) Q
 
TEST D ^%QUECREA
 Q

