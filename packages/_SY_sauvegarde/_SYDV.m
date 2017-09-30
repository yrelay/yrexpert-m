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

;%SYDV^INT^1^59547,73892^0
SYDV ;
 
ALL(RETOUR) 
 N HOST
 S HOST=$$PCONF^%INCASTO("TYPHOST")
 I HOST="" D ^%VZEAVT("Probleme d'installation : le type de l'ordinateur est introuvable") G END
 S PREF="%SCG"
 I $$EXIST(HOST,PREF) D ^%VZEAVT("Il existe deja des routines prefixees par "_PREFX) G END
 S X0="F %U=1:1 Q:'$D(^ROUTINE(PREF_%U))  ZR  ZS @(PREF_%U)" X X0
 S %N=0,NP=0,GLO=""
 S GLO=$O(^%SCRE(GLO)) Q:GLO=""  S GL="^%SCRE("""_GLO_"""",NP=NP+1 D TR
 D FIN
 G END
TR S NBL=0,X0="ZR  ZI PREF_NP_"" ;;"" X X1"
 S X1="S T=GL_"","""""""")"""
 S X1=X1_" F %U=1:1 S T=$ZO(@T) S:T'="""" VN=@T S %=(T=""""!(T[""^ROUTINE(""""%SCG"")) X:% X2 Q:%  W !,T S %N=%N+1 S LI="" ;;""_T_""=""_VN ZI LI S NBL=NBL+1"
 S X1=X1_" I NBL>100 S NBL=0 ZS @(PREF_NP) S NP=NP+1 ZR  ZI PREF_NP_"" ;;"""
 S X2="ZS @(PREF_NP)"
 X X0
 Q
 
RESALL(RETOUR) 
 N PREFX S PREFX="%SCG"
 N HOST
 S HOST=$$PCONF^%INCASTO("TYPHOST")
 I HOST="" D ^%VZEAVT("Probleme d'installation : le type de l'ordinateur est introuvable") G END
 N OK S OK=$$DIR(HOST,PREFX) G:'(OK) END
 N ROUT S ROUT=$ZP(^ROUTINE(PREFX))
 F %U=0:1 S ROUT=$O(^ROUTINE(ROUT)) Q:$E(ROUT,1,$L(PREFX))'=PREFX  Q:%U>0
 I %U=0 D ^%VZEAVT("Il n'existe pas de routines prefixees par %SCG") G END
 D POCLEPA^%VVIDEO
 S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("suppression du global ---> %SCRE <---  ?"))
 I REP'=1 Q
 D REST1
 Q
FIN 
 S X0="ZL @(PREF_1) ZR +1 ZI PREF_1_"" ;;""_NP_"";""_%N ZS @(PREF_1)"
 X X0 D ZD^%QMDATE4 S DAT=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1)
 F %U=1:1:NP S ^PROGMOD(DAT,PREF_%U)=1
 Q
END D ADR^%QCSCDIR(HOST,RETOUR)
 Q
 
 
GLOB(LISTE,PREFX,RETOUR) 
 N HOST
 S HOST=$$PCONF^%INCASTO("TYPHOST")
 I HOST="" D ^%VZEAVT("Probleme d'installation : le type de l'ordinateur est introuvable") G END
 N OK S OK=$$DIR(HOST,PREFX) G:'(OK) END
 N GLOBAL
 I $$EXIST(HOST,PREFX) D ^%VZEAVT("Il existe deja des routines prefixees par "_PREFX) G END
 S %N=0,NP=0,NBL=0,GLO="",GLOBAL=$$CONCAS^%QZCHAD("^TEMPORAI","z") K @(GLOBAL)
 S GLOBAL=$P(GLOBAL,")",1)
 D ^%VZEATT
 F %Z=0:0 S GLO=$O(@LISTE@(GLO)) Q:GLO=""  D ADR^%QCAGLC("^%SCRE("""_GLO_"""",GLOBAL_","""_GLO_"""")
 S GL=GLOBAL,PREF=PREFX,NP=NP+1 D TR2 S GL=GL_")" K @(GL)
 D FIN
 D TR3
 G END
 
TR2 
 S NBL=0
 S X0="ZR  ZI PREF_NP_"" ;;"" X X1"
 S X1="S T=GL_"","""""""")"""
 S X1=X1_" F %U=1:1 S T=$ZO(@T) S:T'="""" VN=@T S %=(T=""""!(T[""^ROUTINE(""_PREF)) X:% X2 Q:%  X X3 W !,TT S %N=%N+1 S LI="" ;;""_TT_""=""_VN ZI LI S NBL=NBL+1"
 S X1=X1_" I NBL>150 S NBL=0 ZS @(PREF_NP) S NP=NP+1 ZR  ZI PREF_NP_"" ;;"""
 S X2="ZS @(PREF_NP)"
 S X3="S TT=T,%OLD=GLOBAL_"","",L=$L(%OLD),%NEW=""^%SCRE("" F I=$L(T):-1:1 S:$F(TT,%OLD,I)=(I+L) TT=$E(TT,1,I-1)_%NEW_$E(TT,I+L,$L(TT))"
 X X0
 Q
TR3 
 S X0="ZR  ZI PREF_0_"" ;;"" X X1"
 S X1="F %Z=0:0 S GLO=$O(@LISTE@(GLO)) X:GLO="""" X2 Q:GLO=""""  S LI="" ;;^%SCRE(""""""_GLO_"""""""" ZI LI S NBL=NBL+1"
 S X2="ZS @(PREF_0)"
 X X0
 Q
 
RESTOR(PREFX,RETOUR) 
 N HOST
 S HOST=$$PCONF^%INCASTO("TYPHOST")
 I HOST="" D ^%VZEAVT("Probleme d'installation : le type de l'ordinateur est introuvable") Q
 I '(DTM),'($$EXIST(HOST,PREFX)) D ^%VZEAVT("Il n'existe pas de routines prefixees par "_PREFX) G END
 
 S X0="ZL @(PREFX_0) F J=2:1 S LI=$T(+J) Q:LI=""""  S LI=$P(LI,"";;"",2,500),LI=LI_"")"" K @LI"
 X X0
 
REST1 
 S NB=0,$ZT="",Y0="ZL @(PREFX_1) S LIM=+$P($P($T(+1),"";;"",2),"";"",1),%N=+$P($P($T(+1),"";;"",2),"";"",2)"
 S X0="ZL @(PREFX_I) F J=2:1 S LI=$T(+J) Q:LI=""""  S LI=$P(LI,"";;"",2,500),RF=$P(LI,""="",1),VL=$P(LI,""="",2,500),@RF=VL,NB=NB+1"
 S I=0
 X Y0
LOP S I=I+1
 G:I>LIM FLOP
 X X0
 G LOP
FLOP I NB'=%N D ^%VSQUEAK W !,"Probleme de recuperation..."
 S $ZT=""
 G END
 
KILL(PREFX,RETOUR) 
 N HOST
 S HOST=$$PCONF^%INCASTO("TYPHOST")
 I HOST="" D ^%VZEAVT("Probleme d'installation : le type de l'ordinateur est introuvable") G END
 N OK S OK=$$DIR(HOST,PREFX) I '(OK) D ^%VZEAVT("Probleme d'installation : le type de l'ordinateur est introuvable") G END
 S X0="F %U=0:1 Q:'$D(^ROUTINE(PREFX_%U))  ZR  ZS @(PREFX_%U)" X X0
 G END
 
EXIST(HOST,PREF) 
 N OK S OK=$$DIR(HOST,PREF) Q:'(OK) 1
 N ROUT S ROUT=$ZP(^ROUTINE(PREF))
 F %U=0:1 S ROUT=$O(^ROUTINE(ROUT)) Q:$E(ROUT,1,$L(PREF))'=PREF  Q:%U>0
 I %U=0 Q 0
 Q 1
DIR(HOST,PREFX) 
 N DIR
 I $E(PREFX,1,3)'="%SC" D ^%VZEAVT("Le prefixe des routines doit commencer par un ""%SC""") Q 0
 I $L(PREFX)>5 D ^%VZEAVT("Le nombre de lettres composant le prefixe doit etre inferieur a 5") Q 0
 S DIR=$$PCONF^%INCASTO("PSYS")
 I DIR="" D ^%VZEAVT("Probleme d'installation : partition systeme introuvable") Q 0
 
 D ADR^%QCSCDIR(HOST,DIR) Q 1

