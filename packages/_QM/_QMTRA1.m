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

;%QMTRA1^INT^1^59547,73879^0
QMTRA1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,DEJAVU,QSMOTR,C,J,P,F,L,NI,NC,QSMOTRI
 N YY1,CTR,VDEF,MES,M,R,LIEN1,LIEN2,FILS,LIE,%I,%U,DEF,ATLIEN
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S DEJAVU=$$CONCAS^%QZCHAD(TEMP,"DEJAVU")
 S ATLIEN=$$CONCAS^%QZCHAD(TEMP,"ATLIEN")
 S QSMOTR="^RQSGLU(""QMTRA"",$J,""QSMOTR"")"
 S QSMOTRI="^RQSGLU(""QMTRA"",$J,""QSMOTRI"")"
 K @(QSMOTR),@(QSMOTRI)
 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Transformation d'un Schema de donnees"),0)
VDEF S YY1="",VDEF=" ",MES=$$^%QZCHW("Nom du schema de donnees : ")
 D S1^%VLECFL(VDEF,MES,10,5,.CTR,.YY1) Q:((CTR="A")!(CTR="F"))!(YY1=" ")
 S M=YY1 I '($D(^RQSMOD(M))) D ^%VZEAVT($$^%QZCHW("Schema inconnu... ")) G VDEF
 
 S R="" F %I=1:1 S R=$O(^RQSMOD1(M,R)) Q:R=""  D TR(QSMOTR,QSMOTRI)
 S DX=0,DY=3 X XY D CLEBAS^%VVIDEO
 S DX=0,DY=5 X XY W $$^%QZCHW("Transformation des donnees")
 D TRANS(M,QSMOTR,QSMOTRI)
 K @(TEMP)
 K @(QSMOTR),@(QSMOTRI)
 Q
TR(GL,GLI) 
 S C=^RQSMOD1(M,R),J=1
 F I="NI","NC","P","F(1)","F(2)","F(3)","F(4)","F(5)","F(6)","F(7)","F(8)","F(9)","F(10)","L(1)","L(2)","L(3)","L(4)","L(5)","L(6)","L(7)","L(8)","L(9)","L(10)" S @I=$P(C,"^",J),J=J+1
 F %U=1:1:10 S FILS=F(%U) D:FILS'="" CFILS
 F %U=1:1:10 S LIE=L(%U) D:LIE'="" CLIE
 
 S ^RQSMDL1(M,R)=NI_"^"_NC_"^"
 S @GLI@(M,R)=NI
 Q
CFILS 
 S DEF=" "
 S DX=0,DY=3 X XY D CLEBAS^%VVIDEO
 S DX=0,DY=5 X XY W $$^%QZCHW("Le repertoire ")_R_$$^%QZCHW(" est lie hierarchiquement a ")_FILS
 S DX=0,DY=6 X XY W $$^%QZCHW("Donnez les nouveaux attributs liant ces deux repertoires:")
LEC1 D S1^%VLECFL(DEF,$$^%QZCHW("Lien (")_R_$$^%QZCHW("-->")_FILS_$$^%QZCHW(") : "),0,8,.CTR,.YY1)
 I (YY1="")!(YY1=" ") D ^%VZEAVT($$^%QZCHW("Veuillez donner un nom d'attribut lien")) G LEC1
 I $$EXIS(YY1) D ^%VZEAVT($$^%QZCHW("Attribut deja existant. Veuillez donner un autre nom.")) G LEC1
 S LIEN1=YY1
LEC1B D S1^%VLECFL(DEF,$$^%QZCHW("Lien inverse (")_FILS_$$^%QZCHW("-->")_R_$$^%QZCHW(") : "),0,9,.CTR,.YY1)
 I (YY1="")!(YY1=" ") S YY1="~"_LIEN1
 I $$EXIS(YY1) D ^%VZEAVT($$^%QZCHW("Attribut deja existant. Veuillez donner un autre nom.")) G LEC1B
 S LIEN2=YY1
 S @DEJAVU@(R,FILS)=""
 S @GL@(M,R,FILS)=LIEN1
 S @GL@(M,FILS,R)=LIEN2
 S ^RQSMDL2(M,R,LIEN1)=FILS_"^"_LIEN2_"^N^N^"
 Q
CLIE 
 
 Q:$D(@DEJAVU@(LIE,R))
 S DEF=" "
 S DX=0,DY=3 X XY D CLEBAS^%VVIDEO
 S DX=0,DY=5 X XY W $$^%QZCHW("Le repertoire ")_R_$$^%QZCHW(" est lie relationnellement a ")_LIE
 S DX=0,DY=6 X XY W $$^%QZCHW("Donnez les nouveaux attributs liant ces deux repertoires:")
LEC2 D S1^%VLECFL(DEF,$$^%QZCHW("Lien (")_R_$$^%QZCHW("-->")_LIE_$$^%QZCHW(") : "),0,8,.CTR,.YY1)
 I (YY1="")!(YY1=" ") D ^%VZEAVT($$^%QZCHW("Veuillez donner un nom d'attribut lien")) G LEC2
 I $$EXIS(YY1) D ^%VZEAVT($$^%QZCHW("Attribut deja existant. Veuillez donner un autre nom.")) G LEC2
 S LIEN1=YY1
LEC2B D S1^%VLECFL(DEF,$$^%QZCHW("Lien inverse (")_LIE_$$^%QZCHW("-->")_R_$$^%QZCHW(") : "),0,9,.CTR,.YY1)
 I (YY1="")!(YY1=" ") S YY1="~"_LIEN1
 I $$EXIS(YY1) D ^%VZEAVT($$^%QZCHW("Attribut deja existant. Veuillez donner un autre nom.")) G LEC2B
 S LIEN2=YY1
 S @DEJAVU@(R,LIE)=""
 S @GL@(M,R,LIE)=LIEN1
 S @GL@(M,LIE,R)=LIEN2
 S ^RQSMDL3(M,R,LIEN1)=LIE_"^"_LIEN2_"^N^N^"
 Q
EXIS(AT) 
 I $D(@ATLIEN@(AT)) Q 1
 S @ATLIEN@(AT)=""
 Q 0
TRANS(M,GL,GLI) 
 
 
 
 
 
 
 N %I,%U,%U2,%U3,%U4
 N R,AT,NVAT,VAL,OR,IND,RI
 S R="" F %I=1:1 S R=$O(@GL@(M,R)) Q:R=""  S AT="" F %U=1:1 S AT=$O(@GL@(M,R,AT)) Q:AT=""  S NVAT=@GL@(M,R,AT),RI=$$NOMINT(M,R) D:NVAT'=AT MAJ
 Q
MAJ 
 
 S DX=0,DY=22 X XY W "M.A.J de "_R_" : "_AT_" --> "_NVAT
 S VAL=""
 
 F %U2=1:1 S VAL=$$NXTRAV^%QSTRUC8(RI,AT,VAL) Q:VAL=""  S OR="" F %U3=1:1 S OR=$$NXTRAVO^%QSTRUC8(RI,AT,VAL,OR) Q:OR=""  S IND="" F %U4=1:1 S IND=$$NXTRAVOI^%QSTRUC8(RI,AT,VAL,OR,IND) Q:IND=""  D MAJTR
 Q
MAJTR 
 S DX=0,DY=23 X XY W "Individu: "_IND
 D PA^%QSGESTI(RI,IND,NVAT,VAL,OR)
 D PS^%QSGESTI(RI,IND,AT,VAL,OR)
 Q
NOMINT(M,R) 
 N %V S %V=@GLI@(M,R) Q %V

