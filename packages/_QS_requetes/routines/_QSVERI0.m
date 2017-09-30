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

;%QSVERI0^INT^1^59547,73883^0
VERIF ;
 N C,I,J,L,K,NI,NC,R,%R
 N COMPT,R2,L2,%L
 N %VAR,%LIGNE,ERREUR,%ERR,SYNTAX,WARN,GL1,GL2,GL3,GL4,LIENI
 N LLIENI,LLIENI1,GLAUT
 N TYPREP,REPSYS,ERRSYS
 S GL1="^RQSMDL1",GL2="^RQSMDL2"
 S GL3="^RQSMDL3",GL4="^RQSMDL4"
 S GLAUT="^RQSMOD3"
 S COMPT=0,SYNTAX=0,%ERR=0,WARN=0
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("VERIFICATION D'UN SCHEMA DE DONNEES"),0),BLD^%VVIDEO W !,!,!,M D NORM^%VVIDEO
 
 
 
 
 
 
 S ERRSYS=0
 S R="" F %R=0:0 S R=$O(@GL1@(M,R)) Q:R=""  S COMPT=COMPT+1 D TR
 S TYPREP="" F %TR=0:0 S TYPREP=$O(@SYSVU@(TYPREP)) Q:TYPREP=""  I @SYSVU@(TYPREP)>1 D WRITER^%QSVERER("<SYNTAX>",$$^%QZCHW("Il y a trop de repertoires de type ")_TYPREP) S ERRSYS=1
 G:ERRSYS=1 S100
 
 
 
 D INIT^%QSMOSYS(M,GL1,GLAUT,LREPCR)
 F I=1:1:@LREPCR D CREER(@LREPCR@(I),@LREPCR@(I,"NOMINT"),@LREPCR@(I,"NBCLEF"))
 D LIENS^%QSMOSYS(M,GL2,GL3,GL4)
S100 
 S R="" F %R=1:1 S R=$O(@GL2@(M,R)) Q:R=""  S L="" F %L=1:1 S L=$O(@GL2@(M,R,L)) Q:L=""  D T1
 S R="" F %R=1:1 S R=$O(@GL3@(M,R)) Q:R=""  S L="" F %L=1:1 S L=$O(@GL3@(M,R,L)) Q:L=""  D T2
 S R="" F %R=1:1 S R=$O(@GL4@(M,R)) Q:R=""  S L="" F %L=1:1 S L=$O(@GL4@(M,R,L)) Q:L=""  D T3
 D VERIF1^%QSVERI1,VERIF2^%QSVERI2
 
 I SYNTAX=0 D LIEN^%QSVERI2
 I SYNTAX=0 D VERIF3^%QSVERI3
 I SYNTAX=0 D VERIF4^%QSVERI4
 I SYNTAX=0 D VERIF5^%QSVERI5
 S:SYNTAX=0 ^RQSMDL9("CARACT",M,"OKVERIF")=1
 S:SYNTAX'=0 ^RQSMDL9("CARACT",M,"OKVERIF")=0
 I (SYNTAX'=0)!(WARN'=0) D SORTIE
 I SYNTAX=0 W:WARN=0 $$^%QZCHW(" : Schema "_M_".....OK") S:'($D(DY)) DY=20 S DX=1,DY=DY+2 X XY D BLK^%VVIDEO W $$^%QZCHW("Affichage du schema...") D NORM^%VVIDEO H 1 D AFF^%QSVERI6
 Q
T1 S C=@GL2@(M,R,L),J=1 F I="R2","L2" S @I=$P(C,"^",J),J=J+1
 D:R2="" WRITER^%QSVERER("<SYNTAX>",$$^%QZCHW("Il manque le repertoire destination du lien ")_L_$$^%QZCHW(" qui a pour origine ")_R)
 S:L2="" L2="~"_L
 S @TEMPO@(M,"LIES",R,R2,L)="2^"_L2
 S @TEMPO@(M,"LIES",R2,R,L2)="1^"_L
 Q
T2 S C=@GL3@(M,R,L),J=1 F I="R2","L2" S @I=$P(C,"^",J),J=J+1
 D:R2="" WRITER^%QSVERER("<SYNTAX>",$$^%QZCHW("Il manque le repertoire destination du lien ")_L_$$^%QZCHW(" qui a pour origine ")_R)
T S:L2="" L2="~"_L
 S @TEMPO@(M,"LIES",R,R2,L)="3^"_L2
 S @TEMPO@(M,"LIES",R2,R,L2)="3^"_L
 Q
T3 S C=@GL4@(M,R,L),J=1 F I="L2" S @I=$P(C,"^",J),J=J+1
 S:L2="" L2="~"_L
 S @TEMPO@(M,"LIES",R,R,L)="4^"_L2
 S @TEMPO@(M,"LIES",R,R,L2)="5^"_L
 Q
 
TR I (R?1"%".E)&(R'="%") S TXTER=R_$$^%QZCHW(" : nom logique interdit (%) ") D WRITER^%QSVERER("<SYNTAX>",TXTER)
 S C=@GL1@(M,R),J=1 F I="NI","NC","TYPREP" S @I=$P(C,"^",J),J=J+1
 I (NI?1"%".E)&(NI'="%") S TXTER=NI_$$^%QZCHW(" : nom interne interdit (%) ") D WRITER^%QSVERER("<SYNTAX>",TXTER)
 I NI="" D WRITER^%QSVERER("<SYNTAX>",R_$$^%QZCHW(" n'a pas de nom interne")) S NI="?"
 
 S REPSYS=$$VERIF^%QSMOSYS(M,R,NI,TYPREP)
 I REPSYS=1 S:'($D(@SYSVU@(TYPREP))) @SYSVU@(TYPREP)=1
 S:REPSYS=-1 ERRSYS=1
 S @TEMPO@(M,"NOM INTERNE",R)=NI,@TEMPO@(M,"NOMBRE DE CLES",R)=NC
 Q
 
CREER(REP,NINT,NBCLE) 
 D WRITER^%QSVERER("<WARNING>",$$^%QZCHW("Le repertoire ")_REP_$$^%QZCHW(" vient d'etre cree"))
 S @TEMPO@(M,"NOM INTERNE",REP)=NINT
 S @TEMPO@(M,"NOMBRE DE CLES",REP)=NBCLE
 Q
 
SORTIE 
 S @COL@("LGC")=15,@COL@("TITC")=$$^%QZCHW("   ERREUR"),@COL@("COL",1)=$$^%QZCHW("                    TEXTE^")_50_"^LI",@COL@("MSG")=$$^%QZCHW("ERREURS DU SCHEMA ")_M
 D ^%QUKOLO,^%VZEAVT("Affichage du modele s'il n'y a pas d'erreur <SYNTAX> ")
 Q
 
MODIFM 
 S ^RQSMDL9("CARACT",RESUL(1),"OKVERIF")=0
 D ^%VAUTOST
 Q
SUPPM() 
 N OKK
 S OKK=$$KIL^%VCMSCOR
 Q OKK
SUPPC() 
 N OKK
 S OKK=$$KIL^%VCMSCOR
 Q OKK

