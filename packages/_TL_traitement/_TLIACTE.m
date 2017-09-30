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

;%TLIACTE^INT^1^59547,74029^0
%TLIACTE ;
 
 
 
 
 
IMPH N NOMH,POS,GLH,SOR,TIT
 S GLH=$$ADRHIS^%HXIHITU
 S POS=1
 
 S NOMH=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom histogramme")) Q
 I '($$EXHIS^%HXIHITU(GLH,NOMH)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Histogramme inexistant")) Q
 
 S SOR=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer type impression")) Q
 S:SOR="g" SOR="G" S:SOR="s" SOR="S" I "GS"'[SOR S SOR="S"
 
 S TIT=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer titre histogramme")) Q
 
 I '($$^%EDPRLG) Q
 D INIT^%EDCENVL
 D IMPRT^%HXIHIT2(GLH,NOMH,SOR,$$^%QZCHW(TIT))
 I MODAF=1 D REAF^%TLIFEN,IND^%TLIACT3,REAF^%QUPILF("ATT")
 I MODAF=2 D REAF^%TLBAIF(0)
 Q
 
 
TRFGDX N %U,%ATT,%VAL
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Transfert variables % vers GDX"))
 S %ATT=""
 F %U=0:0 S %ATT=$$NXTRIA^%QSTRUC8(CXT("%","BASE"),CXT("%","OBJET"),%ATT) Q:%ATT=""  S ^V($J,"%",%ATT)=$$^%QSCALVA(CXT("%","BASE"),CXT("%","OBJET"),%ATT)
 Q
 
 
TRFTRT N %U,%ATT,%VAL
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Transfert variables % vers TRT"))
 I $D(^V($J,"%"))'=10 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  variables % inexistants dans GDX")) Q
 S %ATT=""
 F %U=0:0 S %ATT=$O(^V($J,"%",%ATT)) Q:%ATT=""  S %VAL="" D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),%ATT,^V($J,"%",%ATT),1)
 Q
 
 
PROLOG 
 D:MODAF ADD^%TLIFEN("LOG","   * "_$$^%QZCHW("prologue"))
 Q
 
CORPS 
 D:MODAF ADD^%TLIFEN("LOG","   * "_$$^%QZCHW("corps"))
 Q
 
EPILOG 
 D:MODAF ADD^%TLIFEN("LOG","   * "_$$^%QZCHW("epilogue"))
 Q
 
 
TRANSTD N LAT,LISTTD,POS,L
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Transfert de TOTEM vers DKBMS"))
 S POS=1,LAT=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(LAT="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom de la liste d'attributs")) Q
 I ('($D(^[QUI]ZLILA(LAT))))&(LAT'="*") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste attributs inexistante")) Q
 S LISTTD=$$RED(ACTI,2) I LISTTD=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("l'indication d'1 liste a traiter est obligatoire")) Q
 S LISTTD=$$SUBST^%ANARBR2(LISTTD,.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(LISTTD="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer 2nd parametre")) Q
 I '($$EX^%QSGEST7(LISTTD)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  2nde liste inexistante")) Q
TRANSDT2 
 D SAUVVAL^%TLUTIL
 D ^TORQYT(LAT,LISTTD),CLEPAG^%VVIDEO
 D RESTVAL^%TLUTIL
TRANSDTF D REAFF^%TLUTIL
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin du transfert"))
 Q
 
 
CREER 
 N ORD,REP,NOM,POS,REPI,VAR,MSG,OORD
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Creation d'un individu"))
 S POS=1,REP=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (REP="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom du repertoire")) S ECHEC=1 Q
 S REPI=$$NOMINT^%QSF(REP)
 I REPI="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Repertoire inconnu")) S ECHEC=1 Q
 S POS=1
 S NOM=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I (NOM="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom individu")) S ECHEC=1 Q
 I $$IR^%QSGEST5(REPI,NOM) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Individu deja existant")) Q
 S VAR=$$RED($$RED(ACTI,1),"TEXTE")
 S OORD=$$RED(ACTI,4) I OORD=0 S OORD="" G APCRE
 S POS=1,OORD=$$SUBST^%ANARBR2(OORD,.CXT,"ATT^%TLIACT3",.POS)
 I (OORD="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("impossible evaluer numero d'ordre")) S ECHEC=1 Q
APCRE 
 D CREERIND(REPI,NOM,OORD)
 Q:ECHEC=1
 S CXT(VAR,"BASE")=REPI,CXT(VAR,"OBJET")=NOM
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,NOM,1)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin creation"))
 Q
 
CREERIND(REPI,NOM,ORD) 
 N MSG
 S ECHEC=0
 G:REPI=$$LIENI^%QSGEL3 CRLIEN
 I $$CREER^%QSGEIND(REPI,NOM,ORD,$S(MODEX=1:0,1:1),.MSG) D:MODAF ADD^%TLIFEN("LOG","  "_MSG) S ECHEC=1
 G FCRE
 
CRLIEN N TX
 I '($$BIENFORME^%QSGES19(NOM,.TX)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Impossible creer individu lien")) D:MODAF ADD^%TLIFEN("LOG",TX) S ECHEC=1 Q
 D:MODEX'=1 CREERNOM^%QSGES19(NOM)
FCRE D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Creation de l'individu")_" "_NOM_" "_$$^%QZCHW("dans")_" "_$$NOMLOG^%QSF(REPI))
 D:MODEX=2 STIND^%TLBAATT(REPI,NOM,OORD,VAR,"AJOUT")
 D:MODAF ADD^%TLIFEN("ATT","NOM <- "_NOM)
 Q
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

