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

;TO3SIM2^INT^1^59547,74870^0
TO3SIM2 ;
 
 S QT=^V($I,YA,$$^%QZCHW("QUANTITE")),%SELEC=1 D ^%ABSIDEN S PINT=0,SIFO=$P(@("^[QUI]NOMENC("_RFNOM_")"),"^",18),LSIFO=$L(SIFO)
 I ($E(SIFO,1)="?")!($E(SIFO,1,3)="""?""") S QTF="?" D REFILS G END
 S $ZT=^TOZE($I,"A")
RETERR G:%ABEND=1 END S AFFECT="^[QUI]ANOMENC("_RFNOM_")" S:@AFFECT="" @AFFECT=0 D ^TO3SIFON G:SIF SIF1 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR
 S AFFECT="%RESUL",%RESUL="RES1"
SIF1 S CAFFECT=@AFFECT,@("QU="_CAFFECT),QTF=QU*QT K CAFFECT G:QTF=0 FIN D REFILS G END
REFILS S ANC=COMP D ^TOEVCOUR I TCP("IND")="" S TCP("CPYA")=COMPID G AFTR
 I $D(^[QUI]FULL(COMP)) S TCP("CPYA")=COMP G AFTR
 S OCOMP=COMP,COMP=TCP("CPR") D ^%ABSIDEN I COMPID'=COMP S TCP("CPYA")=COMPID,COMP=OCOMP G AFTR
 S TCP("CPYA")=TCP("CPR"),COMP=OCOMP
AFTR S TWRF=TWREF_","_^NEXSUN($I,TWREF),@("^[QUI]TREEWORK(NUFA,"_TWRF_")")=TCP("CPYA")_"^"_COMP_"^"_QTF,^NEXSUN($I,TWREF)=^NEXSUN($I,TWREF)+1
 G:QTF["?" END S ^[QUI]TVPAR(NUFA,TWRF,$$^%QZCHW("QUANTITE"))=QTF,^V($I,COMP,$$^%QZCHW("QUANTITE"))=QTF G:TCP("IND")="" UTIS
 S TCP("INDC")=-1 F %U=1:1 S TCP("INDC")=$N(TCP("IND",TCP("INDC"))) Q:TCP("INDC")=-1  S TCP("VINDC")=TCP("IND",TCP("INDC")),^[QUI]TVPAR(NUFA,TWRF,TCP("INDC"))=TCP("VINDC"),^V($I,COMP,TCP("INDC"))=TCP("VINDC")
UTIS D SITU
END K AFFECT,COMPID,LSIFO,PINT,QU,SIFO Q
FIN S %SELEC=0 G END
YAERR S zzz=xxx Q
SITU S ^PHASADM($I,NUFA,"COMP",$$^%QZCHW("ART"),COMP,TWRF)=1,^PHASADM($I,NUFA,"COMP","OK",COMP)=TWRF,^PHASADM($I,NUFA,TWREF,"COMP","OK",COMP)=TWRF Q

