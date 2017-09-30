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

;%TLUTIL^INT^1^59547,74031^0
%TLUTIL ;
 
 
 
 
 
 
SAUVECR 
 Q:(MODAF=0)!(MODAF=3)
 Q:'($D(TRT))
 N T,R,S,%LL,TE
 I '($D(^ZPILFEN2($J,TRT))) S %LL=1 G S1
 
 
 
 I $D(^ZPILFEN2($J,TRT))#10 S %LL=^ZPILFEN2($J,TRT)+1 G S1
 D ^%VZEAVT($$^%QZCHW("Il existe un probleme de gestion des globaux temporaires de sauvegarde. Veuillez proceder au nettoyage de la partition des routines (menu ADMINISTRATEUR d'EXPLOITATION).")) Q
 S %LL=1
S1 S T=-1,^ZPILFEN2($J,TRT)=%LL
S2 S T=$N(^ZPILF($J,T)) Q:T=-1
 S R=-1
S3 S R=$N(^ZPILF($J,T,R)) G:R=-1 S2
 S:$D(^ZPILF($J,T,R))#10 ^ZPILFEN2($J,TRT,%LL,T,R)=^ZPILF($J,T,R)
 
 S S=-1
S4 S S=$N(^ZPILF($J,T,R,S)) G:S=-1 S3
 S:$D(^ZPILF($J,T,R,S))#10 ^ZPILFEN2($J,TRT,%LL,T,R,S)=^ZPILF($J,T,R,S)
 
 S TE=-1
S5 S TE=$N(^ZPILF($J,T,R,S,TE)) G:TE=-1 S4
 S:$D(^ZPILF($J,T,R,S,TE))#10 ^ZPILFEN2($J,TRT,%LL,T,R,S,TE)=^ZPILF($J,T,R,S,TE)
 
 G S5
 
SAUVVAL 
 N TEMPO,%II,%JJ
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SUIT")
 K @(TEMPO)
 S %JJ=0
 F %II="ACTI","ADR","ADRRET","ARRET","CARD","CTRLA","COND","CXT(""@"",""BASE"")","CXT(""@"",""OBJET"")" S %JJ=%JJ+1,@TEMPO@(%JJ)=%II
 F %II="DEROUL","DX","DY","EXP","ETIQ","FIRST","GLOSTO","HACT","HB","HH","HLOG","HALT","IND","ITRI","%IND" S %JJ=%JJ+1,@TEMPO@(%JJ)=%II
 F %II="L","LI","LISTE","LL","LTRI","MD","MG","MODAFF","NBT","NOM","NX","NY","NOEUACT","ORIG","ORIGINE","POS","REP","REPL" S %JJ=%JJ+1,@TEMPO@(%JJ)=%II
 
 F %II="RETOURGO","RETOUROK","SAVIND","SELECIN","SIND","SORT","STOP","TETE","TEXT","TRBOUC","TRLIS","TRT","TYP","VAR" S %JJ=%JJ+1,@TEMPO@(%JJ)=%II
 
 D EMPV^%ANGEPIL(TEMPO)
 K @(TEMPO)
 Q
 
 
RESTVAL 
 D DEPV^%ANGEPIL
 I $D(TRT) D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),"%NOM.TRAITEMENT.COURANT",TRT,1)
 Q
 
RESTECR 
 I (MODAF=0)&('($D(MODAFF))) D INDBAS^%TLIACT3 Q
 I MODAF=0 N CARD,NBT S CARD=@GLOETD@(NIVEAU,"CARDINAL"),NBT=@GLOETD@(NIVEAU,"INDIVIDUS.TRAITES") D INDBAS^%TLIACT3 Q
 I MODAF=3 D LLINE^%TLBAIF Q
 N T,R,S,%LL,TE
 S T=-1,%LL=^ZPILFEN2($J,TRT)
S6 S T=$N(^ZPILFEN2($J,TRT,%LL,T)) G:T=-1 S9
 S R=-1
S7 S R=$N(^ZPILFEN2($J,TRT,%LL,T,R)) G:R=-1 S6
 S:$D(^ZPILFEN2($J,TRT,%LL,T,R))#10 ^ZPILF($J,T,R)=^ZPILFEN2($J,TRT,%LL,T,R)
 
 S S=-1
S8 S S=$N(^ZPILFEN2($J,TRT,%LL,T,R,S)) G:S=-1 S7
 
 S:$D(^ZPILFEN2($J,TRT,%LL,T,R,S))#10 ^ZPILF($J,T,R,S)=^ZPILFEN2($J,TRT,%LL,T,R,S)
 S TE=-1
S11 S TE=$N(^ZPILFEN2($J,TRT,%LL,T,R,S,TE)) G:TE=-1 S8
 S ^ZPILF($J,T,R,S,TE)=^ZPILFEN2($J,TRT,%LL,T,R,S,TE)
 G S11
S9 I %LL=1 K ^ZPILFEN2($J,TRT) G S10
 K ^ZPILFEN2($J,TRT,%LL) S ^ZPILFEN2($J,TRT)=%LL-1
S10 Q:ABANDON=1
 I MODEX=2 D REAF^%TLBAIF(MODAFF) Q
 I $D(MODAFF) D REAF^%TLBAIF(MODAFF) Q
 D REAF^%TLIFEN,IND^%TLIACT3
 Q
 
REAFF 
 
 I (MODAF=0)&('($D(MODAFF))) D INDBAS^%TLIACT3 Q
 I MODAF=0 N CARD,NBT S CARD=@GLOETD@(NIVEAU,"CARDINAL"),NBT=@GLOETD@(NIVEAU,"INDIVIDUS.TRAITES") D INDBAS^%TLIACT3 Q
 I MODAF=3 D LLINE^%TLBAIF Q
 I MODEX=2 D REAF^%TLBAIF(0) Q
 I $D(MODAFF) D REAF^%TLBAIF(0) Q
 D REAF^%TLIFEN,IND^%TLIACT3
 Q

